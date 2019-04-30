#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 05:00:00
#SBATCH -J BWT2index_30-04-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load bowtie2
# Your commands
cd /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/metadata/bowtie2_index
bowtie2-build /home/clno2215/stunning-garbanzo/results/genomics/pilon_assembly/Pilon_assembly_05-04-2019.fasta efaec_pilon
