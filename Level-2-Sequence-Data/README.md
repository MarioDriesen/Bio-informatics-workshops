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
#Installing seqkit might be useful
conda activate amplicon-tutorial
```

---

### 1. Quality check (FastQC)

.....

---

### 2. Adapter & quality trimming (Trim Galore)

.....

---

### 3. Paired-end merging (PEAR)

.....

---

### 4. Dereplication, chimera removal, OTU/ASV clustering (VSEARCH)

.....

---

### 5. Taxonomic classification (SINTAX in VSEARCH).

.....

---
