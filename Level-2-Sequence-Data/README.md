# Level 2 - Amplicon Sequencing Analysis

This second level guides through a small and complete workflow for amplicon sequencing data (16S/18S/ITS)

## Learning Objectives

After completing this level, you should be able to:

-
-
-
-
-

---

## Workshop Contents

### 0. Requirements and download SRA data
#### 0.a Installation of tools + Creation of the environment
```
conda create -n amplicon-tutorial -c bioconda -c conda-forge fastqc trim-galore pear sra-tools vsearch
conda activate amplicon-tutorial
```
*Installing seqkit might be useful*

#### 0.b Downloading data
```
prefetch SRR12345678
fastq-dump --split-files SRR12345678
```
---

### 1. Quality check (FastQC)

```
fastqc SRR35192589_1.fastq SRR35192589_2.fastq -o results/
```

---

### 2. Adapter & quality trimming (Trim Galore)

```
trim_galore --paired SRR35192589_1.fastq SRR35192589_2.fastq -o results/
```

---

### 3. Paired-end merging (PEAR)

```
pear -f results/SRR35192589_1_val_1.fq.gz \
     -r results/SRR35192589_2_val_2.fq.gz \
     -o results/merged
```

---

### 4. Dereplication, chimera removal, OTU/ASV clustering (VSEARCH)

```

```

---

### 5. Taxonomic classification (SINTAX in VSEARCH).

```

```

---
