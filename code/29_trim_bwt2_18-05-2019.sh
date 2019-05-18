#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J trimmomatic_bwt2_18-05-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load bowtie2
module load samtools/1.9
module load trimmomatic
# Your commands
REF=/home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/metadata/bowtie2_index/efaec_pilon
RES=/home/clno2215/stunning-garbanzo/results/transcriptomics/Tn-seq/BWT2/
cd /home/clno2215/projectdata/transcriptomics_data/Tn-Seq_BHI/
for file in `ls trim*.fastq.gz | sed 's/.fastq.gz//'`; do
    trimmomatic SE -phred33 ${file}.fastq.gz ${file}_trimmed.fastq.gz ILLUMINACLIP:/sw/apps/bioinfo/trimmomatic/0.36/rackham/adapters/TruSeq3-SE.fa:2:25:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:25
    bowtie2 -x $REF -U ${file}_trimmed.fastq.gz -p 2  | samtools sort -o $RES${file}.bam
    samtools index $RES${file}.bam
done
cd /home/clno2215/projectdata/transcriptomics_data/Tn-Seq_HSerum/
for file in `ls trim*.fastq.gz | sed 's/.fastq.gz//'`; do
    trimmomatic SE -phred33 ${file}.fastq.gz ${file}_trimmed.fastq.gz ILLUMINACLIP:/sw/apps/bioinfo/trimmomatic/0.36/rackham/adapters/TruSeq3-SE.fa:2:25:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:25
    bowtie2 -x $REF -U ${file}_trimmed.fastq.gz -p 2  | samtools sort -o $RES${file}.bam
    samtools index $RES${file}.bam
done
cd /home/clno2215/projectdata/transcriptomics_data/Tn-Seq_Serum/
for file in `ls trim*.fastq.gz | sed 's/.fastq.gz//'`; do
    trimmomatic SE -phred33 ${file}.fastq.gz ${file}_trimmed.fastq.gz ILLUMINACLIP:/sw/apps/bioinfo/trimmomatic/0.36/rackham/adapters/TruSeq3-SE.fa:2:25:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:25
    bowtie2 -x $REF -U ${file}_trimmed.fastq.gz -p 2  | samtools sort -o $RES${file}.bam
    samtools index $RES${file}.bam
done
