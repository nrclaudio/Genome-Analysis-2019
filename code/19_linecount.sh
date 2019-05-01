#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 05:00:00
#SBATCH -J LineCount_01-05-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
# Your commands
cd /home/clno2215/stunning-garbanzo/results/transcriptomics/BH/bowtie2/
wc -l efaec_pilon_bwt2_30-04-2019.sam 
cd /home/clno2215/stunning-garbanzo/results/transcriptomics/Serum/bowtie2/
wc -l efaec_pilon_bwt2_30-04-2019.sam


