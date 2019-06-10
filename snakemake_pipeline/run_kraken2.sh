#!/bin/bash
set -e -o pipefail
source activate metagenomics

fq1=$1
fq2=$2
prefix=$3
KRAKEN_DB=/mnt/genomeDB/misc/softwareDB/kraken2/minikraken2_v2_8GB 

### run it twice...
kraken2 \
    --db $KRAKEN_DB \
    --paired \
    --threads 8 \
    --output ${prefix}.out \
    --report ${prefix}.kraken2.tsv \
    $fq1 $fq2 \
    --use-mpa-style

### run again for bracken
kraken2 \
    --db $KRAKEN_DB \
    --paired \
    --threads 8 \
    --report ${prefix}.kraken2 \
    $fq1 $fq2 > /dev/null


for tax in s g;
do
bracken -d ${KRAKEN_DB} \
	-i ${prefix}.kraken2 \
	-o ${prefix}.bracken.${tax} \
	-l ${tax^^}

sed 's/ /_/g' ${prefix}.bracken.${tax} | \
    tail -n+2 | \
    cut -f 1,7 > ${prefix}.${tax}
done

gzip ${prefix}.kraken2 ${prefix}.out ${prefix}.bracken.? ${prefix}_bracken.kraken2

