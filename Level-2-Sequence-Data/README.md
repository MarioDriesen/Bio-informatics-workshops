> [!WARNING]
> Warning: This section is currently being updated.
---
> # Level 2 - Amplicon Sequencing Analysis

This second level guides through a small and complete workflow for amplicon sequencing data (16S/18S/ITS)

## Learning Objectives

After completing this level, you should be able to:

- Processing FASTQ/SRA data
- Assessing sequence quality
- Performing trimming and filtering
- Merging paired-end reads
- Performing denoising and dereplication
- Generating OTUs/ASVs
- Detecting chimeras
- Performing taxonomic classification
- Building an abundance table
- Using command-line bioinformatics tools

---

## Workshop Contents

### 0. Requirements and download SRA data
#### 0.a Installation of tools + Creation of the environment
```
conda create -n amplicon-tutorial -c bioconda -c conda-forge fastqc seqkit trim-galore pear sra-tools vsearch
conda activate amplicon-tutorial
```
*SeqKit might be helpful. Indeed, Seqkit is an ultrafast, lightweight "Swiss army knife" for manipulating FASTA and FASTQ files, making it exceptionally useful for amplicon profiling and other marker-gene sequencing workflows*

#### 0.b Create the folders
```
mkdir -p data
mkdir -p results
mkdir -p database
```
> [!NOTE]
> Be sure to create the folders in a path that you're familiar with.
---

#### 0.c Downloading data
```
prefetch SRR12345678
fastq-dump SRR12345678 \
           --split-files \
           -o data/
```
<img width="1142" height="677" alt="fastqcfiles" src="https://github.com/user-attachments/assets/a099555e-339a-45c5-9852-14bd1275e2c0" />

> [!WARNING]
> Warning: A FASTQ file may look simple, but it contains both biological sequence and important technical metadata.
---

### 1. Quality check (FastQC)

```
fastqc data/SRR12345678_1.fastq \
       data/SRR12345678_2.fastq \
       -o results/
```
<img width="983" height="435" alt="fastqc" src="https://github.com/user-attachments/assets/cc1fe362-090d-45db-aa50-fdbc8160ded0" />

> [!WARNING]
> This image is currently being created.
---

### 2. Adapter & quality trimming (Trim Galore)

```
trim_galore --paired \
            --quality 20 \
            --length 20 \
            -o results/trimmed/ \
            data/SRR12345678_1.fastq \
            data/SRR12345678_2.fastq
```

---

### 3. Paired-end merging (PEAR)

```
pear -f results/SRR12345678_1_val_1.fq.gz \
     -r results/SRR12345678_2_val_2.fq.gz \
     -o results/merged
```

---

### 4. OTU/ASV Workflow with VSEARCH
#### 4.a Dereplication
```
vsearch --derep_fulllength results/merged.assembled.fastq \
        --output results/derep.fasta \
        --sizeout
```
#### 4.b Denoising (UNOISE3 for zOTUs/ASVs)
```
vsearch --cluster_unoise results/derep.fasta \
        --minsize 8 \
        --unoise3 results/zotus.fasta
```
Alternatively, for OTUs (97% identity):
```
vsearch --cluster_size results/derep.fasta \
        --id 0.97 \
        --centroids results/otus.fasta
```
#### 4.c Chimera Removal
```
vsearch --uchime3_denovo results/zotus.fasta \
        --nonchimeras results/zotus.nochim.fasta
```

---

### 5. Taxonomic classification (SINTAX in VSEARCH).
> [!WARNING]
> You need a reference database (e.g., SILVA, RDP, UNITE) formatted for VSEARCH. here you can find the databases https://zenodo.org/records/14930035
#### 5.a Generate a fasta file from a fastq file
```
vsearch --fastq_filter results/merged.assembled.fastq \
        --fastaout results/merged.assembled.fasta
```
#### 5.b Generate the abundance table
```
vsearch --usearch_global results/merged.assembled.fastq \
        --db results/otus.nochim.fasta \
        --id 0.97 \
        --otutabout results/otu_table.txt
```
#### 5.c Merge your abundance table and taxonomy table
```
paste results/otu_table.txt results/otus.sintax > results/otu_table_taxonomy.txt
```
_With your otu_table_taxonomy.txt, you are able to analyse it on R or excel_
---
