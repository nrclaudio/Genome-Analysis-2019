#!/bin/bash

infile=$1

if [ "$infile" == "" ] ; then
    echo "Usage: prokkagff2gtf.sh <PROKKA gff file>"
    exit 0
fi

grep -v "#" $infile | grep "ID=" | cut -f1 -d ';' | sed 's/ID=//g' | cut -f1,4,5,7,9 |  awk -v OFS='\t' '{print $1,"PROKKA","CDS",$2,$3,".",$4,".","gene_id " $5}'

# Use indexed & sorted bam file from anvi-init-bam (or default outut from samtools sort)
# htseq-count -r pos -t CDS -f bam Sample01_indexed.bam test.gtf
