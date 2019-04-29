#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J fastqc_trimmed_29-04-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load fastqc
# Your commands
fastqc /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/BH/*_paired.fq* -o /home/clno2215/stunning-garbanzo/results/transcriptomics/Serum/fastqc_trimmed/

fastqc /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/Serum/*_paired.fq* -o /home/clno2215/stunning-garbanzo/results/transcriptomics/BH/fastqc_trimmed/
