#!/bin/bash
## $PATH_TO_THIS_FILE/create_config.sh $PATH_TO_YOUR_LIB/*h5
## create a config file "conf.yaml"

## default tools
cat <<EOT > conf.yaml
TOOLS:
  FAMAS: /mnt/software/stow/famas-0.0.10/bin/famas
  BWA: /mnt/software/stow/bwa-0.7.10/bin/bwa
  METAPHLAN2_PATH: /mnt/software/unstowable/biobakery-metaphlan2-3d22a72b109b/
  METAPHLAN: /mnt/software/stow/metaphlan-2f1b17a1f4e9/bin/metaphlan.py
  DECONT: /mnt/software/stow/decont-0.4/bin/decont.py
  HUMANN2_PATH:  ~lich/.local/bin/
  DIAMOND_PATH: ~lich/.local/bin/
EOT

## default DBs
cat <<EOD >> conf.yaml
DBS:
  DECONT_GENOME: /mnt/genomeDB/genomeIndices/hg19/bwa_index/nucleotide/hg19.fa
  METAPHLAN_BTDB: /mnt/genomeDB/misc/softwareDB/metaphlan/huttenhower.sph.harvard.edu/metaphlan/bowtie2db/mpa
  METAPHLAN2_PKL: /mnt/genomeDB/misc/softwareDB/metaphlan2/db_v20/mpa_v20_m200.pkl
  METAPHLAN2_DB: /mnt/genomeDB/misc/softwareDB/metaphlan2/db_v20/mpa_v20_m200
  KRAKEN_DB: /mnt/genomeDB/misc/softwareDB/kraken/minikraken_20141208/
EOD

## default profilers to run
cat <<EOP >> conf.yaml
PROFILERS:
  metaphlan: 1
  kraken: 1
  metaphlan2: 1
EOP


{ echo "SAMPLES:"; ls -d1 "$@" | sed 's/\/$//' | awk -F/ '{printf "  %s: %s\n", $NF, $0}'; } | sed 's/.h5:/:/' >> conf.yaml
