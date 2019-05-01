#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J Merge_01-05-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
# Your commands
cd /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/BH
cat *_pass_1_* > trim_paired_pass_1_all.fq.gz
cat *_pass_2_* > trim_paired_pass_2_all.fq.gz
cd /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/Serum
cat *_pass_1_* > trim_paired_pass_1_all.fq.gz
cat *_pass_2_* > trim_paired_pass_2_all.fq.gz
