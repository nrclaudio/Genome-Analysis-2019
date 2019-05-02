#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 05:00:00
#SBATCH -J BWT2alignBH_30-04-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load bowtie2
module load samtools/1.9
# Your commands
cd /home/clno2215/stunning-garbanzo/results/transcriptomics/BH/bowtie2
bowtie2 -x /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/metadata/bowtie2_index/efaec_pilon -1 /home/clno2215/projectdata/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797974_pass_1.fastq.gz -2 /home/clno2215/projectdata/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797974_pass_2.fastq.gz -S efaec_pilon_bwt2_30-04-2019_ERR1797974.sam
samtools view -Sb efaec_pilon_bwt2_30-04-2019_ERR1797974.sam > efaec_pilon_bwt2_30-04-2019_ERR1797974.bam
samtools sort efaec_pilon_bwt2_30-04-2019_ERR1797974.bam
samtools index efaec_pilon_bwt2_30-04-2019_ERR1797974.bam
rm efaec_pilon_bwt2_30-04-2019_ERR1797974.sam

