## Project Plan

# What is the hypothesis?

It is a exploratory experiment (serum vs stand medium). 


# What is our data?

De novo assembly with Illumina, PacBio, Nanopore. 

 - How were the samples prepared? 

    Isolated strain, don't worry about heterozygosity. Extra analysis: BLAST against human to check for contaminations. 2Mbp

    Enterobacteria -> look for general properties.

 - What kind of data we have?

    DNA reads as well as RNA reads. Annotation of the genome.  
    Both long (PacBio and Nanopore) and short reads (Illumina). 

    RNA-seq : Illumina + Nanopore
    Genome assembly : Illumina + PacBio 


Expression analysis with RNA-seq.

# What can we download?

What is the accession number -> SRA archive -> find the reads. -> unzip it to FASTQ files

# Steps for analysis

1. Check read quality with FASTQC. 
    
    Get rid of bad reads and trim the tail of the read that is not good enough.

    3 thousand CDS. 

    How to run FASTQC with all the different types of data. 

2. Filter the reads

    Tool for filtering the reads -> trimomatic

3. Genome assembly 

    - PacBio -> Celera
    - Nanopore -> MaSURCa
    - Illumina HiSeq -> Spades

4.  Genome assembly quality checking

Find software to do so 

5. Compare genome assemblies and their qualities 

6. Synteny, look at the genome, does the genes look equally disposed as closely related genomes
7. 

