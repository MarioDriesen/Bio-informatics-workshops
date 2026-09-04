# 00. Why Linux?

Linux is one of the most important operating systems in scientific computing, bioinformatics, cloud computing, and high-performance computing.

Before learning Linux commands, it is useful to understand what Linux is, how it is structured, and why it became so important in bioinformatics.

---

## Learning Objectives

After completing this section, you should be able to:

- Explain what Linux is.
- Understand the difference between the Linux kernel and a Linux distribution.
- Describe the basic layers of a Linux system.
- Explain why Linux is widely used in bioinformatics.
- Understand why command-line skills are useful for reproducible research.

---

## 1. What is Linux?

Technically, **Linux** refers to the **operating system kernel**.

The kernel is the core part of an operating system. It manages communication between the computer hardware and the software running on the system.

The Linux kernel is responsible for tasks such as:

- Detecting and managing hardware.
- Managing memory.
- Managing processes.
- Handling input and output.
- Controlling access to files and devices.

However, when people say "Linux", they often mean a complete **Linux operating system** or **Linux distribution**.

A Linux distribution combines the Linux kernel with additional software, such as:

- System libraries.
- Command-line tools.
- Package managers.
- Graphical interfaces.
- Applications.

Examples of Linux distributions include:

- Ubuntu
- Debian
- Fedora
- Rocky Linux
- Arch Linux

In bioinformatics, you will often interact with Linux through the **command line** rather than through a graphical interface.

---

## 2. The Layers of a Linux System

A Linux system can be understood as several layers working together:

```text
Hardware
   ↓
Kernel
   ↓
System libraries
   ↓
Shell
   ↓
Applications and utilities
```
### 2.1 Hardware
<img width="1280" height="720" alt="Slide3" src="https://github.com/user-attachments/assets/c22aeb7a-f991-4d55-80e4-998625c984d5" />

The hardware layer consists of the physical components of the computer, such as:

- CPU
- RAM
- Storage devices
- Network cards
- Input/output devices

The operating system needs to communicate with this hardware in a controlled and reliable way.

### 2.2 Kernel
<img width="1280" height="720" alt="Slide4" src="https://github.com/user-attachments/assets/c337f067-6bd2-4a8a-9090-ee4e3fda0330" />

The kernel is the central part of the operating system.

It acts as a bridge between software and hardware. User programs do not usually communicate directly with the hardware. Instead, they ask the kernel to do this for them.

The kernel manages:

- CPU scheduling
- Memory allocation
- File systems
- Input/output devices
- Running processes
- System security and permissions

This is important because many programs may be running at the same time. The kernel makes sure that these programs can share the computer safely and efficiently.

### 2.3 System Libraries
<img width="1280" height="720" alt="Slide5" src="https://github.com/user-attachments/assets/1236e8c5-5916-46b7-8a8f-ff9477f782cd" />

System libraries are collections of pre-written code that programs can use to perform common tasks.

For example, libraries can provide functions for:

- Reading and writing files.
- Allocating memory.
- Communicating over networks.
- Performing mathematical operations.
- Interacting with the operating system.

Instead of every program having to write these functions from scratch, system libraries provide reusable building blocks.

### 2.4 Shell
<img width="1280" height="720" alt="Slide6" src="https://github.com/user-attachments/assets/0f29f4f6-7b83-4061-8368-c5daa64e8301" />

The shell is a program that allows users to interact with the operating system by typing commands.

In this workshop, we will mainly use Bash, one of the most widely used Unix/Linux shells.

The shell allows users to:

- Navigate folders.
- Create and move files.
- Run programs.
- Combine commands.
- Automate repetitive tasks.
- Write scripts.

This is one of the reasons Linux is so powerful in bioinformatics. Many analyses involve large numbers of files, repeated commands, and automated workflows.

### 2.5 Applications and Utilities
<img width="1280" height="720" alt="Slide12" src="https://github.com/user-attachments/assets/66a341c2-8cb3-41f7-baef-17e3a57cffb1" />

Applications and utilities are programs that run on top of the operating system.

Examples include:

- `ls` = command-line utility / program  
- `cd` = shell built-in command  
- `grep` = command-line utility / program  
- `cat` = command-line utility / program  
- `top` = command-line utility / program  
- `ssh` = command-line utility / program  
- `conda` = package/environment management program  
- `blastn` = bioinformatics command-line program  
- `fastqc` = bioinformatics command-line program  

Some utilities are general-purpose Linux tools. Others are specific bioinformatics tools.
As a bioinformatician, you will often combine both.

---

## 3. Linux, the good, the Terminal, and the Shell

These terms are often used together, but they do not mean exactly the same thing.

### Terminal

The terminal is the interface where you type commands.

It is the window or application that gives you access to the command line.

### Shell

The shell is the program that reads your commands, interprets them, and sends instructions to the operating system.

Examples of shells include:

- Bash
- Zsh
- Fish
- Csh

### Command Line

The command line is the text-based way of interacting with the computer.
Instead of clicking through menus, you type commands.

For example:

```Shell
pwd
ls
cd my_folder
```
At first, the command line may feel less intuitive than a graphical interface. However, it becomes very powerful when working with many files or repetitive tasks.

---

## 4. How Linux Differs from Other Operating Systems

Linux differs from operating systems such as Windows and macOS in several important ways.

### Open Source

Linux is open source. This means that the source code can be inspected, modified, and shared.
This is important in science because it supports:

- Transparency
- Reproducibility
- Community development
- Long-term availability of tools

### Flexible

Linux can run on many different systems, including:

- Personal computers
- Servers
- Cloud platforms
- Supercomputers
- Embedded devices
- Android-based devices

### Command-Line Friendly

Linux was designed with command-line usage in mind.
This makes it especially useful for:

- Automation
- Data processing
- Server administration
- Bioinformatics pipelines
- High-performance computing

---

## 5. A Short History of Linux

Linux did not appear out of nowhere. It grew out of decades of work on Unix, academic computing, free software, and open collaboration.

### 5.1 Unix: the starting point

The history of Linux starts with **Unix**, an operating system developed at Bell Labs in the late 1960s and early 1970s.

Unix became influential because it was designed around several powerful ideas:

- Keep tools small and focused.
- Let tools work together.
- Treat files as a central concept.
- Use text as a common format.
- Make the system useful for programmers.

Another important reason Unix spread widely was the **C programming language**. C made Unix easier to modify and move to different types of computers. This portability helped Unix spread through universities, research institutes, and companies.

Many ideas that bioinformaticians use today, such as command-line tools, pipes, scripts, and remote servers, come from the Unix tradition.

---

### 5.2 From Unix to free software

During the early years of computing, software was often shared more freely between researchers and programmers. Over time, however, more software became proprietary and restricted.

In response to this, Richard Stallman started the **GNU Project** in 1983. The goal of GNU was to create a complete Unix-like operating system that users were free to use, study, modify, and share.

GNU produced many important tools that are still used on Linux systems today, including:

- compilers
- editors
- command-line utilities
- shells
- development tools

<img width="1280" height="720" alt="Slide12" src="https://github.com/user-attachments/assets/128eb4a7-f76e-44e4-ac86-0afb5274f61b" />

The GNU Project also created the **GNU General Public License (GPL)**. This license allows software to be shared and modified, but requires modified versions to keep the same freedoms.

This idea became very important for the growth of Linux and open-source software.

---

### 5.3 BSD and the Unix legal problems

Another important Unix-like system was **BSD**, the Berkeley Software Distribution, developed at the University of California, Berkeley.

BSD contributed many important improvements to Unix, especially in networking. However, in the early 1990s, legal disputes between Unix System Laboratories and BSD developers created uncertainty around BSD-based systems.

This legal uncertainty slowed BSD adoption at an important moment.

At the same time, another Unix-like project was beginning to gain attention: Linux.

---

### 5.4 The missing piece! 
<img width="1280" height="720" alt="Slide14" src="https://github.com/user-attachments/assets/7a0d2f5d-f3ec-44f2-afa0-21d5cad8c976" />


In 1991, Linus Torvalds, a student at the University of Helsinki, began writing his own Unix-like kernel for personal computers.

A **kernel** is the core part of an operating system. It manages hardware, memory, processes, files, and communication between software and the computer.

Torvalds announced his project online and invited feedback from others. What started as a personal hobby project quickly attracted contributors from around the world.

The Linux kernel became especially powerful when combined with GNU tools. Together, the Linux kernel and GNU software formed a complete free operating system.

This is why some people use the name **GNU/Linux**, although in everyday language most people simply say **Linux**.

---

### 5.5 The rise of Linux distributions
<img width="1280" height="720" alt="Slide15" src="https://github.com/user-attachments/assets/02acbb58-ed68-4fd4-b010-b752e52bcbd2" />


A kernel alone is not enough to make a usable operating system.

A complete Linux system usually includes:

- the Linux kernel
- GNU command-line tools
- a shell, such as Bash
- system libraries
- package managers
- installation tools
- applications

A complete packaged version of Linux is called a **Linux distribution**, or **distro**.

Examples include:

- Debian
- Ubuntu
- Fedora
- Rocky Linux
- Arch Linux

Distributions made Linux easier to install, update, and use. They also introduced package managers, which help users install software and handle dependencies automatically.

For bioinformatics, this is important because many tools depend on other software libraries. Package managers and environment managers make it easier to install and reproduce computational workflows.

---

### 5.6 Why this history matters for bioinformatics

Linux became important in bioinformatics because it inherited several useful traditions from Unix and free software:

- command-line tools
- automation through scripting
- open-source development
- remote server access
- reproducible workflows
- compatibility with high-performance computing systems

Most modern bioinformatics pipelines are built on these ideas.

When you learn Linux, you are not just learning an operating system. You are learning the working style behind much of modern computational biology.

---

### Key Takeaways

- Unix introduced many ideas that are still central to Linux.
- The GNU Project created many free software tools used in Linux systems.
- The GPL helped protect the freedom to use, modify, and share software.
- Linux began in 1991 as a kernel developed by Linus Torvalds.
- Linux distributions combine the kernel with tools, libraries, package managers, and applications.
- The Unix/Linux tradition strongly shaped modern bioinformatics workflows.

---

## 6. Why Linux is Important in Bioinformatics

Linux is widely used in bioinformatics because it is well suited for working with large datasets, command-line tools, remote servers, and automated workflows.

### 6.1 Most Bioinformatics Tools Use the Command Line

Many bioinformatics tools are designed to be run from the command line.
Examples include:

- BLAST
- FastQC
- BWA
- Bowtie2
- SAMtools
- BEDTools
- Nextflow
- Snakemake
  
Learning Linux makes it easier to install, run, and combine these tools.

### 6.2 Bioinformatics Often Uses Large Files

Bioinformatics datasets can be very large.
Examples include:

- FASTQ files
- FASTA files
- BAM files
- VCF files
- Genome assemblies
- Annotation files

The command line is efficient for inspecting, filtering, searching, and processing these files.
For example, you can quickly look at the first few lines of a file:

```Shell
head reads.fastq
```
example output: 
```text
@SEQ_ID_1
GATTTGGGGTTTAAAGGG
+
IIIIIIIIIIIIIIIIII
@SEQ_ID_2
ATCGATCGATCGATCGAT
+
IIIIIIIIIIIIIIIIII
```
A FASTQ file stores sequencing reads in blocks of four lines:

**note**
FASTQ files are usually very large. Opening them in a normal text editor can be slow or even crash the editor.
Command-line tools such as `head`, `tail`, `less`, and `wc` allow you to inspect large files safely.

A sequence identifier.
The DNA sequence.
A separator line, usually starting with +.
A quality score line.

Or count the number of lines:

```Shell
wc -l reads.fastq
```
example output:
```text
4000 reads.fastq
```
because each FASTQ read uses four lines, this file would contain 1000reads. 

### 6.3 Linux is Standard on Clusters and Supercomputers

Large bioinformatics analyses are often performed on:

High-performance computing clusters
University servers
Cloud platforms
Supercomputers

These systems usually run Linux.

This means that learning Linux prepares you to work in professional and research computing environments.

### 6.4 Linux Supports Reproducible Research

Reproducibility is very important in science.

Linux supports reproducible research because it works well with:

- Shell scripts
- Package managers
- Containers
- Workflow managers
- Version control systems

Examples include:

- Conda
- Docker
- Singularity / Apptainer
- Git
- Nextflow
- Snakemake

These tools help researchers describe, share, and repeat analyses more reliably.

---

## 7. Why Learn the Command Line?

The command line is useful because it allows you to:

- Work efficiently with many files.
- Repeat analyses consistently.
- Document your workflow.
- Automate repetitive tasks.
- Run tools on remote servers.
- Combine multiple programs into pipelines.

For example, instead of opening hundreds of files manually, you can use one command to search through many files at once.
This is one of the key skills in bioinformatics.

---

### Key Takeaways
Linux is technically the kernel, but the word is often used to describe a complete operating system.
A Linux system consists of multiple layers: hardware, kernel, libraries, shell, and applications.
The shell is the command interpreter that allows users to interact with the system.
Linux is widely used in bioinformatics because it is open source, flexible, powerful, and common on servers and clusters.
Learning the command line is an essential first step toward reproducible bioinformatics workflows.

---

### Recommended External Resources

Software Carpentry: The Unix Shell
 https://swcarpentry.github.io/shell-novice/

The Linux Kernel Documentation
 https://www.kernel.org/doc/

The Linux Foundation
 https://www.linuxfoundation.org/

TOP500 Supercomputer Statistics
 https://www.top500.org/statistics/details/osfam/1/

NCBI BLAST+ Command Line Tools
 https://blast.ncbi.nlm.nih.gov/doc/blast-help/downloadblastdata.html
