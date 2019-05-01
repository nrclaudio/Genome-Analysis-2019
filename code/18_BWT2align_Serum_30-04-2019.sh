#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 05:00:00
#SBATCH -J BWT2alignSerum_30-04-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load bowtie2
# Your commands
cd /home/clno2215/stunning-garbanzo/results/transcriptomics/Serum/bowtie2
(bowtie2 -x /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/metadata/bowtie2_index/efaec_pilon -1 /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/Serum/trim_paired_ERR1797969_pass_1_paired.fq.gz,/home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/Serum/trim_paired_ERR1797970_pass_1_paired.fq.gz,/home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/Serum/trim_paired_ERR1797971_pass_1_paired.fq.gz -2 /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/Serum/trim_paired_ERR1797969_pass_2_paired.fq.gz,/home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/Serum/trim_paired_ERR1797970_pass_2_paired.fq.gz,/home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/trimmed_data/Serum/trim_paired_ERR1797971_pass_2_paired.fq.gz -S efaec_pilon_bwt2_30-04-2019.sam) 2>>bowtie.log

