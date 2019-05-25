#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J quast-25-05-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load quast
# Your commands
quast.py /home/clno2215/stunning-garbanzo/results/genomics/paper_assembly/Assembled_genome.fasta -o /home/clno2215/stunning-garbanzo/results/genomics/quast/paperquast
