#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J SamTools_07-05-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load samtools/1.9
# Your commands
cd /home/clno2215/stunning-garbanzo/results/transcriptomics/BH/bowtie2
samtools sort -o efaec_pilon_bwt2_30-04-2019_ERR1797973_sorted.bam efaec_pilon_bwt2_30-04-2019_ERR1797973.bam
samtools index efaec_pilon_bwt2_30-04-2019_ERR1797973_sorted.bam
rm efaec_pilon_bwt2_30-04-2019_ERR1797973.bam
samtoools sort -o efaec_pilon_bwt2_30-04-2019_ERR1797974_sorted.bam  efaec_pilon_bwt2_30-04-2019_ERR1797974.bam
samtools index efaec_pilon_bwt2_30-04-2019_ERR1797974_sorted.bam
rm efaec_pilon_bwt2_30-04-2019_ERR1797974.bam
cd /home/clno2215/stunning-garbanzo/results/transcriptomics/Serum/bowtie2
samtools sort -o efaec_pilon_bwt2_30-04-2019_ERR1797969_sorted.bam efaec_pilon_bwt2_30-04-2019_ERR1797969.bam
samtools index efaec_pilon_bwt2_30-04-2019_ERR1797969_sorted.bam
rm efaec_pilon_bwt2_30-04-2019_ERR1797969.bam
samtoools sort -o efaec_pilon_bwt2_30-04-2019_ERR1797970_sorted.bam  efaec_pilon_bwt2_30-04-2019_ERR1797970.bam
samtools index efaec_pilon_bwt2_30-04-2019_ERR1797970_sorted.bam
rm efaec_pilon_bwt2_30-04-2019_ERR1797970.bam
samtoools sort -o efaec_pilon_bwt2_30-04-2019_ERR1797971_sorted.bam  efaec_pilon_bwt2_30-04-2019_ERR1797971.bam
samtools index efaec_pilon_bwt2_30-04-2019_ERR1797971_sorted.bam
rm efaec_pilon_bwt2_30-04-2019_ERR1797971.ba
