
# Chapter 5

# Navigation & Paths

## Learning to Walk Through Linux

> *A map is useless unless you know where you're standing.*

---

## Difficulty

⭐⭐☆☆☆

## Reading Time

50–60 minutes

## Practice

1 hour

## Progress

```text
Linux Foundations

█████░░░░░

20%
```

---

# A Story

Imagine waking up in the middle of a huge city.

You don't know

where you are.

You don't know

where your hotel is.

You don't even know

which direction is north.

Someone says,

> "Walk two streets left."

Left from where?

The instruction is meaningless.

Linux thinks exactly the same way.

Every command you run

has a location.

If the computer doesn't know where you are,

navigation becomes impossible.

Today's chapter is about learning to always know

**where you stand.**

---

# Before Commands...

Let's ask a different question.

When you open your terminal,

where are you?

You probably never thought about it.

Yet the shell always knows.

It has to.

Every process running inside Linux has a concept called the **current working directory**.

Think of it as your current address.

Whenever you open a new shell,

Linux quietly places you somewhere.

Usually,

inside your home directory.

You didn't ask.

It simply begins there.

---

# Mental Model

Imagine carrying a tiny flag.

```text
Filesystem

/

├── home

│    └── mohit

│          └── Projects

│                └── linux-book

└── etc
```

Now imagine

the flag.

```text
/

├── home

│    └── mohit  ← 🚩

│          └── Projects

└── etc
```

The flag represents

your current location.

Linux always knows

where your flag is.

Navigation simply moves

the flag.

---

# The Question Every Explorer Asks

If you're walking through a forest,

what's the very first question?

Not

"Which way should I go?"

Instead,

> "Where am I?"

Linux asks the same thing.

That's exactly why

`pwd`

exists.

---

# `pwd`

The name is surprisingly logical.

It stands for

**Print Working Directory.**

Not

Present Working Disk.

Not

Print Windows Directory.

Working.

Directory.

Think about those words.

Working

means

the place you're currently operating.

Directory

means

folder.

So the command literally means

> "Tell me the folder I'm currently working inside."

---

Run it.

```bash
pwd
```

Example output

```text
/home/mohit
```

The shell isn't showing every folder on the computer.

It's answering one simple question.

> "Where is my flag?"

---

# Why This Matters

Suppose you type

```bash
touch notes.txt
```

Where will the file appear?

Linux doesn't randomly choose.

It creates the file

exactly where your flag currently stands.

Understanding `pwd`

explains the behavior of dozens of commands.

---

# Moving Around

Knowing where you are

is only half the story.

Now you want to move.

Imagine standing outside your house.

You decide to visit a friend.

Walking changes your location.

Linux has a walking command too.

---

# `cd`

The command is short.

Only two letters.

```bash
cd
```

It stands for

**Change Directory.**

Notice something beautiful.

It doesn't say

"Open."

It doesn't say

"Enter."

It says

**Change.**

Because your location changes.

Not the directory.

You move.

The directory stays exactly where it is.

---

# Another Mental Model

Don't imagine opening folders.

Imagine yourself walking.

```text
Before

/

└── home

     └── mohit 🚩

After

/

└── home

     └── mohit

          └── Projects 🚩
```

The filesystem never moved.

You did.

---

# Your First Walk

Suppose you're here.

```text
/home/mohit
```

You type

```bash
cd Projects
```

Now

```bash
pwd
```

returns

```text
/home/mohit/Projects
```

One step.

Nothing magical happened.

The flag moved.

---

# Absolute Navigation

Earlier,

we learned absolute paths.

Let's use one.

```bash
cd /etc
```

Notice something.

Linux doesn't care

where you were before.

It starts at

```text
/
```

and walks down.

Exactly like following a GPS route from the beginning.

---

# Relative Navigation

Suppose you're already here.

```text
/home/mohit
```

Instead of typing

```bash
cd /home/mohit/Projects/linux-book
```

you simply write

```bash
cd Projects/linux-book
```

Shorter.

Cleaner.

Faster.

Because your current location already provides context.

---

# Going Home

Now here's something that feels like magic

until you understand it.

Type

```bash
cd
```

with

no arguments.

Where do you think Linux takes you?

Home.

Always.

Because your shell knows

where your home directory is.

It's one of the nicest little conveniences in Linux.

---

# The `~` Symbol

Meet one of the most useful shortcuts.

```text
~
```

People often call it

"tilde."

In Bash,

it usually means

**your home directory.**

If your home is

```text
/home/mohit
```

then

```bash
cd ~
```

and

```bash
cd /home/mohit
```

do the same thing.

The shell quietly expands

`~`

before executing the command.

You'll discover many such expansions later.

---

# Coffee Break ☕

Why use `~` at all?

Imagine logging into different computers.

Today,

your username is

`mohit`.

Tomorrow,

you SSH into a server where your account is

`msahu`.

If you always wrote

```text
/home/mohit
```

your commands would break.

But

```text
~
```

always points to **your** home,

regardless of your username.

Tiny shortcut.

Huge convenience.

---

# Meet `.`

This little dot

confuses almost everyone.

```text
.
```

It simply means

**the current directory.**

That's all.

Nothing mysterious.

If your flag stands here,

```text
/home/mohit/Projects
```

then

`.`

also refers to

```text
/home/mohit/Projects
```

It's a name for

where you already are.

---

# Meet `..`

Now meet its older sibling.

```text
..
```

This means

**the parent directory.**

Imagine climbing a tree.

```text
/

└── home

     └── mohit

          └── Projects 🚩
```

Typing

```bash
cd ..
```

moves you

one branch upward.

```text
/

└── home

     └── mohit 🚩

          └── Projects
```

Nothing more.

Nothing less.

---

# Climbing Multiple Levels

Suppose you're here.

```text
/home/mohit/Projects/linux-book
```

You want to reach

```text
/home
```

Instead of writing the whole path,

you can climb.

```bash
cd ../../
```

Read it slowly.

One parent.

Another parent.

Now you're there.

Understanding the tree makes this obvious.

---

# Battle Story ⚔

Almost every Linux beginner experiences this.

You type

```bash
rm file.txt
```

Linux replies

```
No such file or directory
```

You panic.

The file exists.

You can see it in the graphical file manager.

So why can't Linux?

The answer is often simple.

You're standing

in the wrong directory.

Not a permissions problem.

Not corruption.

Just the wrong location.

That's why experienced engineers often ask one question first.

```bash
pwd
```

Location before investigation.

---

# Linux Philosophy 🐧

Notice something.

Linux rarely asks,

"Where is the file?"

Instead,

it often asks,

> "Where are **you**?"

Navigation begins with the user,

not the destination.

It's a subtle difference,

but one that shapes how the command line feels.

---

# Your Exploration Mission

Without copying commands,

try to complete this journey.

Start here.

```text
/home/mohit
```

Visit

```
Projects
```

Return home.

Go to root.

Visit

```
etc
```

Return home again.

Finally,

verify your location.

If you can complete that journey confidently,

you're beginning to think in paths instead of commands.

---

# Common Beginner Mistakes

### Thinking `cd` changes folders

It doesn't.

It changes

**your location.**

---

### Forgetting where you are

Always check

```bash
pwd
```

before assuming.

---

### Memorizing paths

Understand the tree instead.

Memory fades.

Understanding lasts.

---

# Future Mohit 💡

One day,

you'll SSH into a production server,

land inside an unfamiliar directory,

run

```bash
pwd
```

once,

and immediately understand your surroundings.

You'll navigate without fear,

because you'll trust the map in your head.

That confidence begins with this chapter.

---

# Interview Corner 🎯

**What does `pwd` stand for?**

Print Working Directory.

---

**What does `cd` do?**

It changes the shell's current working directory.

---

**What is an absolute path?**

A path beginning at `/`.

---

**What is a relative path?**

A path interpreted from the current working directory.

---

**What do `.` and `..` represent?**

`.` is the current directory.

`..` is the parent directory.

---

**What does `~` represent?**

Usually the current user's home directory.

---

# Mini Project

Create your own small directory tree.

```text
practice/

├── linux/

│    ├── notes/

│    ├── scripts/

│    └── projects/

└── backups/
```

Now practice navigating **without using tab completion**.

Move only with:

* `cd`
* `pwd`
* `.`
* `..`
* `~`
* absolute paths
* relative paths

Repeat until you stop thinking about the commands and start thinking about the map.

---

# Summary

Today you learned that navigation is not about commands.

It's about location.

The shell always knows where you are.

`pwd` reveals your current location.

`cd` moves you.

Absolute paths describe complete routes.

Relative paths depend on where you're standing.

`.` names the current directory.

`..` points to the parent.

`~` brings you home.

These ideas are simple,

but they become the foundation of everything you'll do in Linux.

---

# 30-Second Revision

```text
pwd  → Where am I?

cd   → Move somewhere else

/    → Root directory

~    → Home directory

.    → Current directory

..   → Parent directory

Absolute Path → Starts from /

Relative Path → Starts from where you are
```

---

# Remember One Thing

> **Linux navigation is not about remembering commands. It is about always knowing where your flag is on the filesystem tree.**

---

# Next Chapter

Now that you can **move** through Linux,

it's time to start **working** inside it.

In the next chapter, we'll meet the everyday tools that every Linux user uses constantly:

* `ls`
* `mkdir`
* `touch`
* `cp`
* `mv`
* `rm`
* `rmdir`

But we won't learn them as isolated commands.

We'll follow the **life of a file**—from the moment it's created, to being copied, renamed, moved, and finally deleted.

Because files are the fundamental objects of Linux, and once you understand their lifecycle, the command line begins to feel less like typing commands and more like manipulating real objects.

---

### A Note from Your Co-author

This chapter is intentionally gentle.

If you master only one thing here, let it be this:

Whenever you're confused, don't rush to type more commands.

Pause for one second and ask:

> **"Where am I?"**

That single habit has saved Linux administrators countless hours, and it's one of the first habits worth building.

