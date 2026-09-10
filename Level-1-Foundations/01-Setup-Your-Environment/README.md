# Getting Access to Linux

Before starting the Linux Shell exercises, you need access to a Linux environment running Bash. There are three recommended ways to do this:

## Before You Begin

To follow this tutorial, make sure you have:

- A reliable internet connection.
- A modern web browser such as Chrome, Edge, Brave, or Firefox.
- A GitHub account. If you don't already have one, create an account at https://github.com/join before continuing.

> 💡 New to GitHub? Account creation only takes a few minutes.

## Option 1: Using Github codespaces

We recommend completing this tutorial in GitHub Codespaces. Codespaces provides a ready-to-use development environment directly in your browser, eliminating the need to install software locally.

Advantages include:

- Consistent setup for all participants
- No local installation required
- Direct access to the tutorial files
- Integrated VS Code experience

All credits go to the people of Eco-flow. I used their workflow and adapted it. You can follow theirs too: 
nice set up: [Eco_flow_set_up_codespaces](https://eco-flow.github.io/training/setup/)
documentation by github: [Codespaces_GitHub](https://docs.github.com/en/codespaces/quickstart)

### Start Your Codespace

1. Open the repository:
   [https://github.com/YOUR-ORG/YOUR-REPO](https://github.com/MarioDriesen/Bio-informatics-workshops/edit/main/Level-1-Foundations/01-Setup-Your-Environment/README.md)

2. Click **Code**.

3. Select the **Codespaces** tab.

4. Choose **Create codespace on main**.

5. Wait for the environment to build and open in your browser.

<img width="933" height="624" alt="image" src="https://github.com/user-attachments/assets/bfa5f793-d93b-4894-a615-320a4e7dd409" />

## Getting Familiar with Your Codespace

Once the Codespace has finished loading, you'll see a browser-based version of VS Code similar to the screenshot below.

<img width="950" height="917" alt="image" src="https://github.com/user-attachments/assets/c93320e2-ae4f-4c26-bbcc-e673eebf0022" />

## Getting Familiar with Your Codespace

![Bioinformatics Workshops Codespacespace is divided into several key areas:

### 1. Activity Bar (far left)

The vertical icon bar gives access to important tools:

- **Explorer** 📁: Browse project files and folders.
- **Search** 🔍: Find text across the repository.
- **Source Control** 🌿: View Git changes and commits.
- **Extensions** 🧩: Manage VS Code extensions.

For most of this workshop, you'll mainly use the Explorer and Source Control views.

### 2. Explorer Panel

The Explorer displays the workshop structure:

Bio-informatics-workshops/ ├── .devcontainer/ ├── Level-1-Foundations/ ├── Level-2-Sequence-Data/ ├── Level-3-Workflows/ └── README.md

Each level contains learning material, exercises, and example files. 
> 💡 If you're unsure where to start, open `README.md` and follow the roadmap.

### 3. Editor Area 

The central area is where files are opened. 
In this screenshot, `README.md` is displayed as a rendered Markdown preview rather than raw text. 

You can: 
- Open files by clicking them in the Explorer.
- Switch between tabs at the top.
- Edit documents and scripts.
- Preview Markdown files.

### 4. Terminal 

The terminal appears in the lower panel. 
This is where you'll run Linux commands, execute analyses, and work with Git. In the screenshot, the prompt shows: 

```bash
/workspaces/Bio-informatics-workshops
```
Try it yourself:
```bash
pwd
```
this command should return a path ending in:
```bash
Bio-informatics-workshops
```

### 5. Copilot Chat

On the right-hand side you'll find GitHub Copilot Chat.

You can use it to:

- Explain commands
- Debug errors
- Generate code snippets
- Ask questions about files in the repository

>[!WARNING]
>Copilot is a helpful assistant, but always verify important scientific, bioinformatics, or analytical results yourself.]

### 6. Status Bar

The bar at the bottom of the window displays useful information such as:

- Current Git branch
- Connection status
- Active environment
- Notifications and warnings
- Quick Orientation Checklist

---

Before continuing, make sure you can:

- [] Open a file from the Explorer
- [] Preview a Markdown document
- [] Open a terminal
- [] Run pwd
- [] Locate the workshop folders
- [] Find the README roadmap

> [!TIP]
> 🎉 Great work! Now you're ready to continue to **[02 - Basic Linux Commands](../02-Basic-Linux-Commands/README.md).

## Option 2: Install Ubuntu on Your Computer (Permanent or Live USB)

If you want the full Linux experience, you can install Ubuntu directly on your computer or run it from a USB drive without modifying your existing operating system.
you can of course choose to install another Linux distro, this is the one we use. 

### Advantages
- Full Linux environment
- Best performance
- Works offline
- Suitable for long-term use

### Ubuntu Installation Guide
Follow the official Ubuntu documentation:

[Ubuntu](https://ubuntu.com/desktop/docs/en/latest/tutorial/install-ubuntu-desktop/)

You can choose between:

- **Install Ubuntu permanently** alongside or instead of your current operating system.
- **Try Ubuntu from a USB drive** without making permanent changes to your computer.

### test

When you open Ubuntu for the first time you will see that Ubuntu has a nice "user-interface" that is very similar to Windows and therefore is very user friendly. 
Once installed: Explore Ubuntu :)

We will not use this nice user-interface because our final goal is to learn to work on clusters, to do all of our heavy work. 
Clusters do not have a nice virtual interface and rely solely on command line terminals. This is the real "code" running, always in the background. 
Here we can write out everything we want to do "scripting"

open a terminal: crtl + Alt +  T (You will need this for the rest of the tutorial) 
test by typing: 
```
pwd
```
you should see the current directory path you are in. 
/home/yourname 

you are ready for the next part :) 
---

## Option 2: Windows Subsystem for Linux (WSL)

If you are using Windows 11, the easiest option is often the **Windows Subsystem for Linux (WSL)**. WSL allows you to run a Linux environment directly on Windows without using a full virtual machine. It is lightweight, easy to install, and provides an experience very similar to working on a real Linux server.

### What You Can Do with WSL

After installation, you will be able to:

- Use a Linux terminal (Ubuntu)
- Compile and run code
- Use tools such as Git, Python, Node.js, and Docker
- Work in an environment similar to real Linux servers

### Requirements

Before installing WSL, make sure you have:

- Windows 11 (version 22H2 or newer)
- Administrator privileges
- Virtualization enabled in BIOS/UEFI (https://support.microsoft.com/en-us/windows/experience/enable-virtualization-on-windows)

To verify that virtualization is enabled:

1. Open **Task Manager**
2. Select the **Performance** tab
3. Click **CPU**
4. Check that **Virtualization** shows **Enabled**

<img width="808" height="600" alt="{E8369718-E214-4D5B-89CA-163525463681}" src="https://github.com/user-attachments/assets/501649eb-5b98-4dc8-a180-96f1a8200029" />


### Installing WSL
guide by microsoft: https://learn.microsoft.com/en-us/windows/wsl/install

#### 1. Open PowerShell as Administrator

- Right-click the **Start** menu or type "powershell"
- Select **Terminal (Administrator)** or **Windows PowerShell (Administrator)**
<img width="634" height="698" alt="{9560EDEC-957A-48F4-95BE-91BB8A2CF35C}" src="https://github.com/user-attachments/assets/c07de3f5-03d5-4f5d-9509-cdebae7090e7" />

#### 2. Run the installation command

```powershell
wsl --install
```
<img width="680" height="387" alt="{57AD1748-51F9-4122-B11A-F5D333624299}" src="https://github.com/user-attachments/assets/8b0f891e-f919-4d7f-93a9-7de7932be1b3" />

## Restart your computer
The restart is required!

## Verify the installation
Run the next command on Powershell
```
wsl --status
```
You should see Ubuntu running with WSL 2.

# Lauch Linux
From the Start menu → Ubuntu
or
From PowerShell
```
wsl
```
test by typing: 
```
pwd
```
you should see the current directory path you are in. 
/home/yourname 

---

## Option 3: Using your institution's cluster 

The cluster is a great place and since the end of this workshop series includes Nextflow which are heavy pipelines (depending on the data) we highly recommend using it. 
All the commands, apps, etc. you can do on your local Linux through WSL or a local installed distro can be executed on the cluster. 
The instructions and commands are the same on the cluster whith some minor changes to the bash files but we will explain this later on. 
I cannot provide a text here for all the clusters in the world and how to acces them. As an example I post a link to the guidelines of the Walloon ones below: 

https://support.ceci-hpc.be/doc/QuickStart/ConnectingToTheClusters/#connecting-to-the-clusters


### Useful Resources

- [Install Ubuntu Desktop](https://ubuntu.com/desktop/docs/en/latest/tutorial/install-ubuntu-desktop/)
- [Microsoft WSL Installation Guide](https://learn.microsoft.com/windows/wsl/install)
- [Enable Virtualization on Windows](https://support.microsoft.com/en-us/windows/experience/enable-virtualization-on-windows)
- [GitHub Codespaces Documentation](https://docs.github.com/en/codespaces)
- [CeCi Walloon SuperComputer](https://support.ceci-hpc.be/doc/QuickStart/ConnectingToTheClusters/#connecting-to-the-clusters)
