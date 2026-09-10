> [!WARNING]
> Warning: Still in process of making it. 

# Introduction to Bash Scripting

In Part 2, you learned how to navigate the Linux command line and run individual commands. In this tutorial, you will combine commands, store information in variables, and create reusable scripts.

By the end of this tutorial, you will be able to:

- Connect commands using pipes
- Redirect command output to files
- Select groups of files with wildcards
- use command-line flags
- Inspect and modify file permissions
- Create and use Bash variables
- Explain what the `$PATH` variable does
- Create and run a Bash `.sh` script
- Create and run a Python `.py` script
- Download and install Nextflow

## 1. Connecting Commands and Files

Linux commands are often designed to perform one specific task well. Their real power becomes apparent when commands are connected to form a small workflow.

### Pipes

A pipe, written as `|`, sends the output of one command directly to another command.

```bash
command_1 | command_2
```

for example: 

```bash
printf "zebra\nmouse\nant\nmouse\n" | sort | uniq
```
This command:

1. Creates four lines of text with printf
2. Sends the lines to sort
3. Sends the sorted lines to uniq
4. Prints the unique values

**Bioinformatics Example:** 

Counting FASTQ Reads A FASTQ record normally occupies four lines. We can therefore count the lines and divide the result by four:

```bash
zcat mt_reads.fastq.gz | awk '{print $1 / 4}'
```
> [!WARNING]
> This calculation assumes that the FASTQ file is properly formatted and that every record contains exactly four lines.

### Redirection 

Normally, command output is printed in the terminal. Redirection allows you to save that output in a file. 
| Symbol | Meaning |
| --- | --- | 
| `>` | Write output to a file, replacing existing contents |
| `>>` | Add output to the end of a file |
| `<` | Use a file as the input for a command | 

Create or overwrite a file: 
```bash
echo "Sample A" > samples.txt
```
Appenda another line: 
```bash
echo "Sample B" >> samples.txt
```
Inspect the result:
```bash
cat samples.txt
```
> [!WARNING]
> Be careful with >. If the destination file already exists, its previous contents will be replaced.
