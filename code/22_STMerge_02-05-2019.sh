#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J SamTools_02-05-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load samtools/1.9
# Your commands
cd /home/clno2215/stunning-garbanzo/results/transcriptomics/BH/bowtie2
samtools merge merged.bam *.bam
cd /home/clno2215/stunning-garbanzo/results/transcriptomics/Serum/bowtie2
samtools merge merged.bam *.bam
