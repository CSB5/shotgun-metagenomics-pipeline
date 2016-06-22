#!/bin/bash
## $PATH_TO_THIS_FILE/create_config.sh $PATH_TO_YOUR_LIB/*h5
## create a config file "conf.yaml"

{ echo "SAMPLES:"; ls -d1 $@ | sed 's/\/$//' | awk -F/ '{printf "  %s: %s\n", $NF, $0}'; } | sed 's/.h5:/:/' > conf.yaml
