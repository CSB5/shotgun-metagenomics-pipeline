Shotgun Metagenomics Pipeline
============
Description:
----------
This pipeline is based on Bpipe (https://github.com/ssadedin/bpipe), and is now routinely used by the group to process 
(pair-end) shotgun metagenomics samples.
Requirements:
-----------
 * Bpipe 0.9.9 beta 1 (sge_fixes branch)
 * MetaPhlAn 1.7.7 (http://huttenhower.sph.harvard.edu/metaphlan)
 * Kraken 0.10.5 beta (https://ccb.jhu.edu/software/kraken/)
 * BWA 0.7.10 (http://bio-bwa.sourceforge.net/)
 * famas 0.0.10 (https://github.com/andreas-wilm/famas.git)
 * Customized scipts:
  - split_metaphlan_table.sh
  - merge_tables.py (CSB5/misc_scripts/merge_tables.py)
  - decont.py (CSB5/decont)

Usage:
----------
```
$ bpipe test -n200 run_metagenomics_pipeline.bpipe Sample_Folder1 <Sample_Folder2 Sample_Folder3 ...>
$ bpipe run -n200 run_metagenomics_pipeline.bpipe Sample_Folder1 <Sample_Folder2 Sample_Folder3 ...>
```
