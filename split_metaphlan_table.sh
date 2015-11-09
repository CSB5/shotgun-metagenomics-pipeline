#!/bin/bash

INFILE=$1
PREFIX=$2

sed -E 's/.*\|//' $INFILE \
  | awk -v prefix=$PREFIX '{var=substr($0, 0,1); print >prefix".table."var} '
