# Shell & Terminal Foundations

> Week 1 - Linux Journey

---

# What is Linux?

Linux is an operating system kernel.

The kernel is responsible for managing hardware resources such as CPU, memory, storage, networking, and devices.

Users normally do not communicate with the kernel directly.

Instead, they communicate through a **Shell**.

---

# Terminal vs Shell

Many beginners confuse these two.

## Terminal

A Terminal is simply an application that allows you to type commands.

Examples:

- GNOME Terminal
- Konsole
- xterm
- Windows Terminal

Think of it as a keyboard + screen.

---

## Shell

A Shell is a program that understands commands typed by the user.

Examples:

- bash
- zsh
- fish
- sh

The shell interprets commands and communicates with the Linux kernel.

---

## Relationship

```
User
   │
   ▼
Terminal
   │
   ▼
Shell (bash)
   │
   ▼
Kernel
   │
   ▼
Hardware
```

The terminal only provides an interface.

The shell performs the actual work.

---

# Bash

Bash stands for

> Bourne Again SHell

It is the default shell on many Linux distributions.

A Bash script is simply a sequence of shell commands stored in a file.

Example:

```bash
#!/bin/bash

echo "Hello World"
```

Execute

```bash
chmod +x script.sh
./script.sh
```

---

# Current Working Directory

Useful commands

```bash
pwd
```

Prints current directory.

```bash
cd directory
```

Move into a directory.

```bash
cd ..
```

Move one directory up.

```bash
cd ~
```

Move to home directory.

```bash
cd -
```

Move back to previous directory.

---

# Absolute vs Relative Path

Absolute path

```
/home/mohit/Desktop/file.txt
```

Starts from root.

Relative path

```
Desktop/file.txt
```

Starts from current directory.

---

# Root Directory

```
/
```

Everything inside Linux starts from root.

Example

```
/
├── home
├── etc
├── usr
├── var
├── boot
├── dev
└── tmp
```

---

# Root User

Root is the superuser.

UID = 0

Root can:

- Read any file
- Modify any file
- Delete any file
- Install software
- Manage users
- Kill any process
- Change permissions
- Configure the operating system

Become root

```bash
sudo -i
```

or

```bash
sudo su
```

Exit

```bash
exit
```

Use root carefully.

With great power comes great responsibility.

---

# Environment Variables

Variables store information.

Create

```bash
name=Mohit
```

Access

```bash
echo $name
```

Important variables

```bash
$HOME
$PATH
$USER
$PWD
$SHELL
```

View all

```bash
env
```

---

# Command Substitution

Sometimes we want the output of one command to become part of another.

Syntax

```bash
$(command)
```

Examples

```bash
echo $(date)

echo $(pwd)

echo $(whoami)
```

---

# Arithmetic Expansion

Bash can evaluate arithmetic.

```bash
echo $((5+2))
```

Examples

```bash
$((num+5))

$((num%10))

$((num/10))
```

Used heavily in Bash scripting.

---

# Background Processes

Commands ending with

```bash
&
```

run in the background.

Example

```bash
sleep 30 &
```

Background processes execute in child shells.

Variable changes inside a child shell do not affect the parent shell.

---

# Helpful Built-in Commands

Current user

```bash
whoami
```

Current directory

```bash
pwd
```

Current shell

```bash
echo $SHELL
```

Current date

```bash
date
```

Current calendar

```bash
cal
```

Random Unix quote

```bash
fortune
```

---

# Things to Remember

- Terminal and Shell are different.
- Bash is a shell.
- `/` is the root directory.
- Root user has unrestricted privileges.
- Variables are assigned without spaces.

Correct

```bash
count=5
```

Incorrect

```bash
count = 5
```

- `$` expands variables.
- `$()` executes commands and returns their output.
- `$(( ))` performs arithmetic.

---

# Mental Model

```
You

↓

Terminal

↓

Bash

↓

Kernel

↓

Hardware
```

Everything you type in the terminal is interpreted by the shell before reaching the operating system.
