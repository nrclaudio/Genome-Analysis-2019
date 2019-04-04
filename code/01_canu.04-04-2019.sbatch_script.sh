#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J canu-04-04-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load canu
# Your commands
canu -p canu.04-04-2019 -d canu_outdir.04-04-2019 genomeSize=3.1m -pacbio-raw /home/clno2215/stunning-garbanzo/data/genomics/raw_data/*_PacBio_* 
