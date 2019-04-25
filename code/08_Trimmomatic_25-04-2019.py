#! python
import os
import sys
import subprocess

for fileR1 in os.listdir('.'):
    dividing = fileR1.split(".")
    if ("R1" in fileR1):
        fileR2 = fileR1.replace('R1', 'R2')
        if os.path.isfile('.' + fileR2):
            dividing1 = fileR2.split(".")
            log1 = dividing[0]
            output1 = dividing[0]
            output2 = dividing1[0]
            subprocess.call("trimmomatic PE -threads 10 -phred33 " + '.' + fileR1 + " " + '.' + fileR2 + " " + processed + output1 + "_trimmed.fastq.gz " + "output_forward_unpaired.fq.gz " + processed + output2 + "_trimmed.fastq.gz " + "output_reverse_unpaired.fq.gz " + " LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:35" + " >" + log + log1 + "_trimmomatic.txt" + " 2>&1", shell=True)
