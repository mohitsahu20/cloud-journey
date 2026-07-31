# Files, Permissions & Processes

> Week 1 - Linux Journey

*"Everything in Linux is a file."*

---

# The Linux Filesystem

Linux organizes everything as files.

Not just documents.

Everything.

```
/
├── home
├── etc
├── usr
├── var
├── dev
├── proc
├── sys
├── tmp
└── boot
```

Some of these aren't even "real" files.

Many are interfaces to the kernel.

For example,

```
/proc
```

contains information about currently running processes.

```
/dev
```

contains device files.

Your keyboard, mouse, SSD, even terminals appear as files.

This is one of Linux's most beautiful design ideas.

> **Everything is a file.**

---

# File Ownership

Every file has an owner.

```
-rw-r--r--
```

is not random symbols.

It represents permissions for three different groups.

```
Owner

Group

Others
```

Think like this:

```
Project Report

↓

Owner
    Mohit

Group
    Students

Others
    Everyone else
```

Each group gets its own permissions.

---

# Permissions

Linux has only three permissions.

```
r
```

Read

```
w
```

Write

```
x
```

Execute

Example

```
-rwxr-xr--
```

Break it.

```
-

rwx

r-x

r--
```

Meaning

```
File

Owner
Read
Write
Execute

Group
Read
Execute

Others
Read
```

---

# Reading Permission

Allows viewing contents.

Examples

```bash
cat notes.txt

less file.txt

head file.txt
```

---

# Writing Permission

Allows modifying.

Examples

```bash
echo hello > file

nano file

vim file
```

---

# Execute Permission

Allows Linux to execute the file.

Without execute permission

```bash
./script.sh
```

fails.

Grant execute permission

```bash
chmod +x script.sh
```

---

# Root User

Root ignores permission restrictions.

UID

```
0
```

Root can

- Read everything
- Delete everything
- Change ownership
- Install software
- Kill any process

Use carefully.

There is no recycle bin.

---

> 💡 Future Me

If something suddenly starts working after using `sudo`, don't celebrate immediately.

Understand **why** permission was denied in the first place.

---

# File Tests

Bash provides shortcuts to check files.

Regular file

```bash
-f file
```

Directory

```bash
-d file
```

Exists

```bash
-e file
```

Readable

```bash
-r file
```

Writable

```bash
-w file
```

Executable

```bash
-x file
```

Not empty

```bash
-s file
```

Empty

```bash
[ ! -s file ]
```

You'll use these constantly in Bash scripts.

---

# Finding Files

Searching manually is painful.

Linux gives us

```bash
find
```

General syntax

```bash
find <path> <conditions>
```

Examples

Find everything

```bash
find .
```

Find only files

```bash
find . -type f
```

Find directories

```bash
find . -type d
```

Find empty files

```bash
find . -type f -empty
```

Find all text files

```bash
find . -name "*.txt"
```

---

# Recursive Search

One huge realization.

```
ls
```

looks inside one directory.

```
find
```

walks the entire directory tree.

```
Project

├── docs
│   ├── notes.txt
│   └── images
│       └── logo.png
└── src
```

```
find
```

can reach every file automatically.

---

# Deleting Files

Remove one file

```bash
rm file.txt
```

Remove directory

```bash
rm -r folder
```

Be careful.

Linux does not ask twice.

---

> ⚠️ Common Mistake

Never run

```bash
rm -rf /
```

You probably know why.

---

# Processes

A process is simply

> A program that is currently running.

Examples

```
Chrome

VS Code

Spotify

bash

ssh
```

All are processes.

---

# Viewing Processes

Show processes

```bash
ps
```

Detailed view

```bash
ps aux
```

Interactive

```bash
top
```

Better interface

```bash
htop
```

---

# Process ID (PID)

Every process has an ID.

Example

```
PID

3245

1221

540
```

Linux manages processes using PIDs.

---

# Killing Processes

Graceful

```bash
kill PID
```

Force kill

```bash
kill -9 PID
```

Prefer graceful termination whenever possible.

---

# Background Processes

Run in background

```bash
sleep 100 &
```

View jobs

```bash
jobs
```

Bring back

```bash
fg
```

---

# Parent vs Child

One thing that confused me initially.

```
Parent Shell

↓

Child Process

↓

Variable Changes
```

Changes made inside the child do **not** come back to the parent.

Think of it as giving someone a photocopy of a notebook.

They can write on their copy.

Your original notebook doesn't change.

---

# Mental Model

```
Program

↓

Running

↓

Process
```

A file is stored.

A process is alive.

---

# Commands Worth Remembering

```bash
pwd
ls
find
chmod
rm
mv
cp
touch
mkdir
rmdir
cat
less
head
tail
ps
top
htop
kill
jobs
fg
```

---

# Common Mistakes I Made

- Forgetting execute permission.
- Confusing owner with root.
- Thinking `find` behaves like `ls`.
- Printing only `basename` when the question expected the full path.
- Forgetting recursion and trying to solve everything with `for file in *`.

Every one of these mistakes made the concept stick.

---

# Mini Challenge

Without looking anything up, try these.

1.

Find every empty file inside your home directory.

2.

Print only directories.

3.

Print every `.sh` file.

4.

Delete every empty `.log` file.

5.

Write a Bash script that deletes empty files and prints their paths.

If you can do these comfortably, you've understood the core ideas.

---

> 🚀 Looking Ahead

So far we've learned **how Linux stores things**.

Next comes **how Bash thinks**.

Variables.

Arguments.

Input.

Loops.

Conditions.

Pipes.

Regex.

By then, Linux stops feeling like a collection of commands and starts feeling like a language.
