#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 5
#SBATCH -t 05:00:00
#SBATCH -J trim_serum_25-04-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load trimmomatic
# Your commands
cd /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/raw_data/BH
bash cmd_file
