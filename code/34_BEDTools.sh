#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J bedtools 25-05-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load BEDTools
# Your commands
genomeCoverageBed -ibam /home/clno2215/stunning-garbanzo/results/transcriptomics/Tn-seq/BWT2/trim_ERR1801006_pass.bam -g /home/clno2215/stunning-garbanzo/results/genomics/pilon_assembly_improved_SPAdes/Improved_PilonAssembly_15-05-2019.fasta > coverage.txt


