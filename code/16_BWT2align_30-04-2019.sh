#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 05:00:00
#SBATCH -J BWT2align_30-04-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load bowtie2
# Your commands
cd /home/clno2215/stunning-garbanzo/results/transcriptomics/BH/bowtie2
bowtie2 -x /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/metadata/bowtie2_index/efaec_pilon -1 /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/BH/*_pass_1* -2 /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/BH/*_pass_2* -S efaec_pilon_bwt2_30-04-2019.sam
cd /home/clno2215/stunning-garbanzo/results/transcriptomics/Serum/bowtie2
bowtie2 -x /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/metadata/bowtie2_index/efaec_pilon -1 /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/Serum/*_pass_1* -2 /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/Serum/*_pass_2* -S efaec_pilon_bwt2_30-04-2019.sam
