#!/bin/bash

if [[ $1 =~ -.* ]] || [ -z $1 ] ;then
    TOTAL_THREADS=24
    ARGS="$@"
else
    TOTAL_THREADS=$1
    ARGS="${@:2}"
fi


/mnt/projects/rpd/apps.testing/miniconda3/envs/snakemake-3.7.1/bin/snakemake --latency-wait 100 -p -T --snakefile ~lich/projects_backup/metagenomics_pipeline/snakemake_pipeline/Snakefile -j $TOTAL_THREADS --drmaa ' -pe OpenMP {threads} -l {params.resource} -V -b y -cwd -w n'  $ARGS
