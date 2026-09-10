# Part 2: Introduction to Bash Scripting

In Part 1, you learned how to navigate a Linux environment and run individual commands. In Part 2, you will combine commands, store information in variables, create reusable Bash and Python scripts, and apply these skills by installing Nextflow.

> [!NOTE]
> This tutorial assumes that you are working in a Linux terminal, such as the terminal provided by GitHub Codespaces.

---

## Learning Objectives

By the end of this tutorial, you will be able to:

- Connect commands using pipes
- Redirect command output to files
- Select groups of files using wildcards
- Use command-line flags
- Inspect and modify file permissions
- Create and use Bash variables
- Explain what the `$PATH` environment variable does
- Create and run a Bash `.sh` script
- Create and run a Python `.py` script
- Pass command-line arguments to scripts
- Install and test Nextflow

---

## 1. Commands as Building Blocks

Linux commands are often designed to perform one specific task. The real power of the command line becomes apparent when several commands are connected to create a small workflow.

In this section, you will work with:

- Pipes: `|`
- Output redirection: `>` and `>>`
- Input redirection: `<`
- Wildcards: `*`, `?`, and character sets

---

## 2. Pipes

A pipe, written as `|`, sends the standard output of one command directly to the standard input of another command.

The general structure is:

```bash
command_1 | command_2
```

Instead of saving the result of `command_1` in an intermediate file, the pipe passes the result directly to `command_2`.

### Example: Sort and Deduplicate Text

Run:

```bash
printf "zebra\nmouse\nant\nmouse\n" | sort | uniq
```

The command is processed from left to right:

1. `printf` produces four lines of text.
2. `sort` sorts those lines alphabetically.
3. `uniq` removes adjacent duplicate lines.
4. The final result is printed in the terminal.

Expected output:

```text
ant
mouse
zebra
```

### Counting Results

Add `wc -l` to count the number of unique values:

```bash
printf "zebra\nmouse\nant\nmouse\n" | sort | uniq | wc -l
```

Expected output:

```text
3
```

### Bioinformatics Example: Counting FASTQ Reads

A FASTQ record normally occupies four lines. For an uncompressed FASTQ file, count the lines with:

```bash
wc -l mt_reads.fastq
```

For a gzip-compressed FASTQ file, decompress the contents to standard output and count the lines:

```bash
zcat mt_reads.fastq.gz | wc -l
```

To calculate the number of reads automatically:

```bash
zcat mt_reads.fastq.gz | awk '{print $1 / 4}'
```

> [!IMPORTANT]
> This calculation assumes that the FASTQ file is properly formatted and every record contains exactly four lines.

### Try It Yourself

Run the following command:

```bash
printf "sample_C\nsample_A\nsample_B\nsample_A\n" | sort | uniq
```

Then modify it so the final command reports the number of unique sample names.

<details>
<summary>Show the solution</summary>

```bash
printf "sample_C\nsample_A\nsample_B\nsample_A\n" | sort | uniq | wc -l
```

</details>

---

## 3. Redirection

By default, most commands print their output in the terminal. Redirection allows you to send input or output somewhere else, such as a file.

### Write Output to a File

The `>` operator writes output to a file:

```bash
echo "Sample A" > samples.txt
```

Inspect the file:

```bash
cat samples.txt
```

> [!WARNING]
> If the destination file already exists, `>` replaces its previous contents.

### Append Output to a File

The `>>` operator adds output to the end of a file without replacing its existing contents:

```bash
echo "Sample B" >> samples.txt
echo "Sample C" >> samples.txt
```

Inspect the result:

```bash
cat samples.txt
```

Expected output:

```text
Sample A
Sample B
Sample C
```

### Use a File as Input

The `<` operator provides a file as the standard input of a command:

```bash
wc -l < samples.txt
```

This prints only the number of lines. Compare it with:

```bash
wc -l samples.txt
```

The second form displays both the number of lines and the filename.

### Standard Output and Standard Error

Linux commands can produce two main output streams:

- Standard output, also called `stdout`
- Standard error, also called `stderr`

Redirect standard error with `2>`:

```bash
ls file_that_does_not_exist.txt 2> error.log
```

Inspect the error message:

```bash
cat error.log
```

Redirect standard output and standard error to different files:

```bash
ls samples.txt missing.txt > output.log 2> error.log
```

---

## 4. Wildcards

Wildcards allow one expression to match multiple filenames.

Common wildcard patterns include:

- `*` matches any number of characters, including no characters
- `?` matches exactly one character
- `[12]` matches one character from the listed set
- `[A-C]` matches one character from the specified range

### Create Practice Files

```bash
touch sample1_R1.fastq.gz
touch sample1_R2.fastq.gz
touch sample2_R1.fastq.gz
touch sample2_R2.fastq.gz
touch notes.txt
```

### Match All Compressed FASTQ Files

```bash
ls *.fastq.gz
```

### Match Read-One Files

```bash
ls *_R1.fastq.gz
```

### Match a Single Character

```bash
ls sample?_R1.fastq.gz
```

Here, `?` matches the `1` or `2` in the sample name.

### Match a Selected Set

```bash
ls sample[12]_R2.fastq.gz
```

### Store Matching Filenames

```bash
printf "%s\n" *_R1.fastq.gz > read1_files.txt
```

Inspect the result:

```bash
cat read1_files.txt
```

> [!TIP]
> Test a wildcard with `printf`, `echo`, or `ls` before using it in a command that modifies or deletes files.

---

## 5. Command-Line Flags

A flag, also called an option, changes the behaviour of a command. Most short flags begin with one hyphen, while long flags commonly begin with two hyphens.

Examples:

```bash
ls -l
ls -a
ls -h
```

For `ls`:

- `-l` displays a detailed listing
- `-a` includes hidden files
- `-h` displays file sizes in a human-readable format when combined with an option that reports sizes

Short flags can often be combined:

```bash
ls -lah
```

A command may also provide long options:

```bash
ls --all
```

### Find Help

Many commands provide a help page:

```bash
ls --help
```

You can also open the manual:

```bash
man ls
```

Press `q` to leave a manual page.

> [!NOTE]
> Flags are command-specific. For example, `-r` may have a different meaning in two different programs. Always check the relevant help or documentation.

---

## 6. File Permissions

Linux permissions determine who may read, modify, or execute a file.

Inspect the files in the current directory:

```bash
ls -l
```

A permission string may look like:

```text
-rwxr-xr--
```

It can be separated into the following parts:

```text
- rwx r-x r--
│  │   │   │
│  │   │   └── permissions for other users
│  │   └────── permissions for the group
│  └────────── permissions for the owner
└───────────── file type
```

The permission letters mean:

- `r`: read
- `w`: write
- `x`: execute
- `-`: permission is not granted

For a regular file, the first character is normally `-`. For a directory, it is normally `d`.

### Add Execute Permission

To allow the file owner to execute a script:

```bash
chmod u+x my_script.sh
```

A common shorter form is:

```bash
chmod +x my_script.sh
```

Check the result:

```bash
ls -l my_script.sh
```

### Remove Execute Permission

```bash
chmod -x my_script.sh
```

> [!CAUTION]
> Only make scripts executable when you understand and trust their contents.

---

## 7. Variables in Bash

A variable associates a name with a value. Variables make commands and scripts easier to reuse.

Create a variable:

```bash
sample="SRR6357070"
```

Use its value by placing `$` before its name:

```bash
echo "$sample"
```

Curly brackets can make the boundary of a variable name clearer:

```bash
echo "${sample}_R1.fastq.gz"
```

Expected output:

```text
SRR6357070_R1.fastq.gz
```

> [!IMPORTANT]
> Do not place spaces around `=` in a Bash variable assignment.
>
> Correct:
>
> ```bash
> sample="SRR6357070"
> ```
>
> Incorrect:
>
> ```bash
> sample = "SRR6357070"
> ```

### Quoting Variables

Variable references should normally be placed inside double quotation marks:

```bash
filename="sample data.txt"
cat "$filename"
```

Quotation marks prevent a value containing spaces from being divided into separate command-line arguments.

### Command Substitution

Command substitution stores or inserts the output of a command. It uses the syntax `$(command)`.

For example:

```bash
current_directory=$(pwd)
echo "$current_directory"
```

Or:

```bash
echo "This directory contains $(find . -maxdepth 1 -type f | wc -l) files."
```

---

## 8. Environment Variables and `$PATH`

Environment variables contain information that programs and shell sessions can use.

Try:

```bash
echo "$USER"
echo "$HOME"
echo "$PATH"
```

Common environment variables include:

- `$USER`: the current username
- `$HOME`: the current user's home directory
- `$PATH`: directories Bash searches for executable programs

### How `$PATH` Works

`PATH` contains a colon-separated list of directories. When you enter a command such as `python3`, Bash searches these directories from left to right until it finds a matching executable.

Display each directory on a separate line:

```bash
echo "$PATH" | tr ':' '\n'
```

Find the executable that Bash would run:

```bash
command -v bash
command -v python3
```

You can also inspect all matching locations with:

```bash
type -a python3
```

### Temporarily Add a Directory to `$PATH`

```bash
export PATH="$HOME/.local/bin:$PATH"
```

This change applies to the current shell session. Placing `$HOME/.local/bin` before the existing `$PATH` gives programs in that directory priority over programs with the same name in later directories.

### Make the Change Persistent

For Bash, add the export statement to `~/.bashrc`:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
source "$HOME/.bashrc"
```

> [!WARNING]
> Only add directories that you trust to `$PATH`. Bash may execute programs from those directories when you enter a command.

---

## 9. What Is a Script?

A script is a text file containing instructions for an interpreter. Instead of entering the same commands manually each time, you save the instructions and run them together.

Common filename extensions include:

- `.sh` for Bash scripts
- `.py` for Python scripts
- `.R` for R scripts
- `.pl` for Perl scripts

The extension helps people recognize the language, but the interpreter determines how the script is processed.

### What Is an Interpreter?

An interpreter is a program that reads and executes code. Examples include:

- `bash` for Bash code
- `python3` for Python code
- `Rscript` for R code

Check where the interpreters are located:

```bash
command -v bash
command -v python3
```

---

## 10. Create Your First Bash Script

You will create a small script that reports information about a text file.

### Step 1: Create the Script

Create and open a new file:

```bash
nano file_report.sh
```

Alternatively, create `file_report.sh` from the VS Code Explorer and open it in the editor.

### Step 2: Add the Code

Copy the following code into `file_report.sh`:

```bash
#!/usr/bin/env bash

# Stop when an unhandled command fails.
set -e

# Require exactly one command-line argument.
if [[ "$#" -ne 1 ]]; then
    echo "Usage: $0 FILE" >&2
    exit 1
fi

file="$1"

# Confirm that the supplied path is a regular file.
if [[ ! -f "$file" ]]; then
    echo "Error: '$file' is not a regular file." >&2
    exit 1
fi

echo "File report"
echo "-----------"
echo "File: $file"
echo "Lines: $(wc -l < "$file")"
echo "Size: $(du -h "$file" | cut -f1)"
```

Save the file.

If you are using Nano:

1. Press `Ctrl + O` to write the file.
2. Press `Enter` to confirm the filename.
3. Press `Ctrl + X` to leave Nano.

---

## 11. How the Bash Script Is Built

### The Shebang

```bash
#!/usr/bin/env bash
```

The first line is called a **shebang**. It tells the operating system to locate the Bash interpreter through the current environment.

The shebang is used when you execute the file directly, for example:

```bash
./file_report.sh samples.txt
```

### Comments

```bash
# Stop when an unhandled command fails.
```

Bash ignores text following `#`, except for the `#!` shebang at the beginning of a script.

Comments explain why code exists and make scripts easier to maintain.

### Script Options

```bash
set -e
```

This asks Bash to stop when an unhandled command fails. It can help prevent a script from continuing after an error.

> [!NOTE]
> Error handling in Bash has several subtleties. For an introductory script, `set -e` is useful, but important production workflows should also test expected inputs and command results explicitly.

### A Conditional Statement

```bash
if [[ "$#" -ne 1 ]]; then
    echo "Usage: $0 FILE" >&2
    exit 1
fi
```

This checks whether the user supplied exactly one argument.

- `$#` is the number of arguments
- `-ne` means “not equal” for numeric comparisons
- `$0` is the command used to start the script
- `>&2` sends the message to standard error
- `exit 1` stops the script with a non-zero exit status
- `fi` closes the `if` block

### Positional Arguments

```bash
file="$1"
```

`$1` contains the first value supplied after the script name.

For example:

```bash
./file_report.sh samples.txt
```

In this command, `$1` contains `samples.txt`.

Additional arguments would be available as `$2`, `$3`, and so on.

### Testing a File

```bash
if [[ ! -f "$file" ]]; then
```

This checks whether the supplied path is not a regular file:

- `[[ ... ]]` is a Bash conditional expression
- `!` means “not”
- `-f` tests whether a path is a regular file

### Command Substitution

```bash
$(wc -l < "$file")
```

The `$()` syntax runs a command and substitutes its output into the surrounding command.

---

## 12. Run the Bash Script

### Step 1: Create an Input File

```bash
printf "sample_1\nsample_2\nsample_3\n" > samples.txt
```

### Step 2: Run the Script Through Bash

```bash
bash file_report.sh samples.txt
```

This method does not require execute permission or a shebang because you explicitly start the Bash interpreter.

### Step 3: Make the Script Executable

```bash
chmod +x file_report.sh
```

Check the permissions:

```bash
ls -l file_report.sh
```

### Step 4: Execute the Script Directly

```bash
./file_report.sh samples.txt
```

Expected output will resemble:

```text
File report
-----------
File: samples.txt
Lines: 3
Size: 4.0K
```

The reported disk size can differ between systems.

### Why Is `./` Required?

`./` means “use the file in the current directory.”

The current directory is normally not searched automatically through `$PATH`. Therefore, entering only this may fail:

```bash
file_report.sh samples.txt
```

But this explicitly identifies the file:

```bash
./file_report.sh samples.txt
```

### Three Ways to Run a Bash Script

Run Bash explicitly:

```bash
bash file_report.sh samples.txt
```

Execute a script in the current directory:

```bash
./file_report.sh samples.txt
```

Execute it by name when its directory is included in `$PATH`:

```bash
file_report.sh samples.txt
```

Direct execution requires a valid shebang and execute permission.

### Test the Error Handling

Run the script without an argument:

```bash
./file_report.sh
```

Then try a path that does not exist:

```bash
./file_report.sh missing.txt
```

Observe the error messages and exit statuses:

```bash
echo "$?"
```

A value of `0` usually indicates success. A non-zero value usually indicates that the preceding command reported an error.

---

## 13. Create a Python Script

Python scripts are also plain-text files, but Python uses its own syntax and is processed by the Python interpreter.

You will create a Python version of the file-report script.

### Step 1: Create the File

```bash
nano file_report.py
```

### Step 2: Add the Code

```python
#!/usr/bin/env python3

import sys
from pathlib import Path


def main():
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} FILE", file=sys.stderr)
        return 1

    input_file = Path(sys.argv[1])

    if not input_file.is_file():
        print(f"Error: '{input_file}' is not a regular file.", file=sys.stderr)
        return 1

    with input_file.open() as handle:
        line_count = sum(1 for line in handle)

    print("File report")
    print("-----------")
    print(f"File: {input_file}")
    print(f"Lines: {line_count}")
    print(f"Size: {input_file.stat().st_size} bytes")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
```

Save the file.

---

## 14. How the Python Script Is Built

### The Python Shebang

```python
#!/usr/bin/env python3
```

This tells the operating system to locate the `python3` interpreter through the environment when the script is executed directly.

### Imports

```python
import sys
from pathlib import Path
```

These lines load functionality from Python's standard library:

- `sys` provides access to command-line arguments and standard error
- `Path` provides tools for working with filesystem paths

### The Main Function

```python
def main():
```

This defines a function named `main`. The indented lines below it belong to the function.

Unlike Bash, Python uses indentation to define code blocks.

### Command-Line Arguments

```python
sys.argv[1]
```

`sys.argv` contains the command used to start the script and its arguments:

- `sys.argv[0]` is the script name
- `sys.argv[1]` is the first argument
- `sys.argv[2]` would be the second argument

### Creating a Path

```python
input_file = Path(sys.argv[1])
```

This creates a `Path` object representing the supplied filename.

### Opening the File

```python
with input_file.open() as handle:
```

This opens the file. Python closes it automatically when the indented block finishes.

### Counting Lines

```python
line_count = sum(1 for line in handle)
```

This reads the file one line at a time and counts the lines.

### Formatted Strings

```python
print(f"Lines: {line_count}")
```

The leading `f` creates an f-string. Values inside curly brackets are inserted into the text.

### The Entry Point

```python
if __name__ == "__main__":
    raise SystemExit(main())
```

This starts `main()` when the file is run as a script and uses its return value as the program's exit status.

---

## 15. Run the Python Script

Run it through the Python interpreter:

```bash
python3 file_report.py samples.txt
```

Alternatively, make it executable:

```bash
chmod +x file_report.py
./file_report.py samples.txt
```

Test the error handling:

```bash
./file_report.py
./file_report.py missing.txt
```

Check the final exit status:

```bash
echo "$?"
```

---

## 16. Bash or Python?

Use **Bash** when you mainly need to:

- Run existing command-line programs
- Connect programs with pipes
- Redirect input and output
- Move, rename, or organize files
- Automate a short sequence of shell commands

Use **Python** when you need to:

- Perform more complex calculations
- Parse and validate structured information
- Work with collections such as lists and dictionaries
- Write larger programs with more complicated logic
- Reuse external Python libraries

Bioinformatics projects commonly use both. Bash often coordinates command-line tools, while Python processes, validates, or transforms data.

---

# Capstone Exercise: Install Nextflow

You will now apply several concepts from this tutorial by installing Nextflow.

This exercise combines:

- Checking software requirements
- Downloading a program
- Using pipes and redirection
- Granting execute permission
- Moving an executable
- Adding a directory to `$PATH`
- Confirming which executable Bash finds

> [!NOTE]
> Nextflow versions and requirements can change. Check the official installation documentation if a command in this section no longer works as expected.

---

## 17. Check the Requirements

Nextflow requires Bash and a compatible Java installation.

Check Bash:

```bash
bash --version
```

Check Java:

```bash
java -version
```

At the time this tutorial was prepared, the current Nextflow documentation required Bash 3.2 or later and Java 17 or later. Consult the official Nextflow documentation for the currently supported versions:

<https://www.nextflow.io/docs/latest/install.html>

> [!IMPORTANT]
> If a compatible Java version is not available in your environment, install or activate Java before continuing.

---

## 18. Create a Local Program Directory

Create a directory for executables owned by your user account:

```bash
mkdir -p "$HOME/.local/bin"
```

Here:

- `mkdir` creates a directory
- `-p` creates missing parent directories and avoids an error if the directory already exists
- `$HOME` refers to your home directory

---

## 19. Download Nextflow

The shortest installation command is:

```bash
curl -s https://get.nextflow.io | bash
```

This command contains three important parts:

1. `curl` downloads content from the URL.
2. `-s` uses silent mode to reduce progress output.
3. `| bash` passes the downloaded installer directly to Bash.

> [!CAUTION]
> Piping downloaded content directly into Bash executes it immediately. Only use this pattern with an official source that you trust.

For a more transparent approach, download and inspect the installer first:

```bash
curl -s https://get.nextflow.io > get-nextflow.sh
less get-nextflow.sh
```

Press `q` to leave `less`.

Then execute the inspected installer:

```bash
bash get-nextflow.sh
```

---

## 20. Make Nextflow Executable

Inspect the downloaded file:

```bash
ls -l nextflow
```

Add execute permission:

```bash
chmod +x nextflow
```

Inspect the permissions again:

```bash
ls -l nextflow
```

---

## 21. Move Nextflow into an Executable Directory

Move the program into the local binary directory:

```bash
mv nextflow "$HOME/.local/bin/"
```

Confirm that the file is present:

```bash
ls -l "$HOME/.local/bin/nextflow"
```

---

## 22. Add the Directory to `$PATH`

Add the directory for the current terminal session:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Confirm that Bash can find Nextflow:

```bash
command -v nextflow
```

The result should end with:

```text
.local/bin/nextflow
```

The beginning of the path depends on the current user and environment.

To keep the setting in future Bash sessions:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
source "$HOME/.bashrc"
```

> [!TIP]
> Before appending the line, you can check whether `.local/bin` is already configured:
>
> ```bash
> grep -F '.local/bin' "$HOME/.bashrc"
> ```

---

## 23. Test the Nextflow Installation

Run:

```bash
nextflow info
```

You can also display the version:

```bash
nextflow -version
```

If Nextflow displays runtime and version information, the installation was successful.

### Connect the Installation to What You Learned

Consider how the installation used concepts from this tutorial:

- `curl -s` used a command-line flag
- `>` redirected downloaded text into a file
- `|` connected the downloader to Bash in the short installation method
- `chmod +x` granted execute permission
- `$HOME` provided the home-directory path
- `$PATH` told Bash where to search for Nextflow
- `command -v` reported the executable Bash would use

---

## 24. Optional Challenge: Write an Installation Check Script

Create a file named `check_nextflow.sh`:

```bash
#!/usr/bin/env bash

set -e

if ! command -v nextflow > /dev/null 2>&1; then
    echo "Nextflow was not found in PATH." >&2
    exit 1
fi

if ! command -v java > /dev/null 2>&1; then
    echo "Java was not found in PATH." >&2
    exit 1
fi

echo "Nextflow executable: $(command -v nextflow)"
echo "Java executable: $(command -v java)"
echo
echo "Nextflow information:"
nextflow info
```

Make it executable and run it:

```bash
chmod +x check_nextflow.sh
./check_nextflow.sh
```

> [!NOTE]
> `/dev/null` is a special destination that discards output. The expression `> /dev/null 2>&1` discards both standard output and standard error for the command being tested.

---

## ✅ Part 2 Checklist

Before continuing, make sure you can:

- [ ] Connect commands with `|`
- [ ] Explain the difference between `>` and `>>`
- [ ] Redirect an error message with `2>`
- [ ] Select files using `*` and `?`
- [ ] Use and combine command-line flags
- [ ] Inspect permissions with `ls -l`
- [ ] Add execute permission with `chmod +x`
- [ ] Create and read a Bash variable
- [ ] Explain how Bash uses `$PATH`
- [ ] Locate an executable with `command -v`
- [ ] Explain the purpose of a shebang
- [ ] Create and run a `.sh` script
- [ ] Create and run a `.py` script
- [ ] Pass a command-line argument to a script
- [ ] Explain the purpose of an exit status
- [ ] Run `nextflow info`

---

## Clean Up the Practice Files

If you no longer need the practice files, remove them carefully:

```bash
rm -f sample1_R1.fastq.gz sample1_R2.fastq.gz
rm -f sample2_R1.fastq.gz sample2_R2.fastq.gz
rm -f notes.txt read1_files.txt samples.txt error.log output.log
```

Keep the scripts if you want to reuse them:

```text
file_report.sh
file_report.py
check_nextflow.sh
```

> [!CAUTION]
> `rm` permanently removes files from the command line. Check the filenames before running the command.

---

## Next Step

You are now ready to continue to the next workshop:

➡️ [Continue to the Introduction to Nextflow](../03-Introduction-to-Nextflow/README.md)

> [!NOTE]
> Replace the relative link above if your next tutorial uses a different folder name or location.

---

## Further Reading

- [GNU Bash manual](https://www.gnu.org/software/bash/manual/)
- [Bash Scripting Fundamentals](https://www.geeksforgeeks.org/linux-unix/bash-scripting-introduction-to-bash-and-bash-scripting/)
- [Python tutorial](https://docs.python.org/3/tutorial/)
- [Nextflow installation documentation](https://www.nextflow.io/docs/latest/install.html)
- [GitHub documentation: Creating and highlighting code blocks](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks)

---

## Acknowledgements

This tutorial was developed for the Bio-informatics Workshops repository and was informed by existing introductory Linux and Bash training material. Add the names and links of the original authors or projects here if you adapted their examples or teaching structure.

Suggested wording:

> Parts of this lesson were inspired by training material from [ORIGINAL PROJECT OR AUTHORS]. The material was rewritten and expanded for the Bio-informatics Workshops repository. We thank the original authors for making their educational resources available.
