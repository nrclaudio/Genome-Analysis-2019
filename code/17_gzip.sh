#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 24:00:00
#SBATCH -J BWT2align_30-04-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
# Your commands
gzip /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/BH/trim_paired_ERR1797972_pass_1_paired.fq 
gzip /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/BH/trim_paired_ERR1797972_pass_2_paired.fq 
gzip /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/BH/trim_paired_ERR1797973_pass_1_paired.fq
gzip /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/BH/trim_paired_ERR1797973_pass_2_paired.fq  

