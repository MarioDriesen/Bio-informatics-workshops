# Getting Access to Linux

Before starting the Linux Shell exercises, you need access to a Linux environment running Bash. There are three recommended ways to do this:

## Option 1: Install Ubuntu on Your Computer (Permanent or Live USB)

If you want the full Linux experience, you can install Ubuntu directly on your computer or run it from a USB drive without modifying your existing operating system.
you can of course choose to install another Linux distro, this is the one we use. 

### Advantages
- Full Linux environment
- Best performance
- Works offline
- Suitable for long-term use

### Ubuntu Installation Guide
Follow the official Ubuntu documentation:

https://ubuntu.com/desktop/docs/en/latest/tutorial/install-ubuntu-desktop/

You can choose between:

- **Install Ubuntu permanently** alongside or instead of your current operating system.
- **Try Ubuntu from a USB drive** without making permanent changes to your computer.

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
---

## Option 3: Using your institution's cluster or codespaces

Codespaces is a very nice way to learn the basics of Linux and working inside Github. 
The downside, you cannot run big tasks, it needs credits, storage is limited. 
https://docs.github.com/en/codespaces/quickstart

Cluster: 
The cluster is a great place and since the end of this workshop series includes Nextflow which are heavy pipelines (depending on the data) we highly recommend using it. 
All the commands, apps, etc. you can do on your local Linux through WSL or a local installed distro. 
The instructions and commands are the same on the cluster whith some minor changes to the bash files but we will explain this later on. 
I cannot provide a text here for all the clusters in the world and how to acces them. As an example I post a link to the guidelines of the Walloon ones below: 

https://support.ceci-hpc.be/doc/QuickStart/ConnectingToTheClusters/#connecting-to-the-clusters


### Useful Resources

- [Install Ubuntu Desktop](https://ubuntu.com/desktop/docs/en/latest/tutorial/install-ubuntu-desktop/)
- [Microsoft WSL Installation Guide](https://learn.microsoft.com/windows/wsl/install)
- [Enable Virtualization on Windows](https://support.microsoft.com/en-us/windows/experience/enable-virtualization-on-windows)
- [GitHub Codespaces Documentation](https://docs.github.com/en/codespaces)
- [CeCi Walloon SuperComputer](https://support.ceci-hpc.be/doc/QuickStart/ConnectingToTheClusters/#connecting-to-the-clusters)
