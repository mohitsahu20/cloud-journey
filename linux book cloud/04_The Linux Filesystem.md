
# Chapter 4

# The Linux Filesystem

## Why Everything Starts with `/`

> *Learning to Navigate a City Instead of a Maze*

---

## Difficulty

⭐⭐☆☆☆

## Reading Time

50–60 minutes

## Practice

45 minutes

## Progress

```text
Linux Foundations

████░░░░░░

16%
```

---

# A Story

Imagine you land in a city you've never visited before.

No Google Maps.

No street names.

No sign boards.

Someone gives you an address.

> "Meet me at Building 42."

You ask,

> "Where is Building 42?"

They answer,

> "Just go."

Not helpful.

Now imagine another city.

Every road has a name.

Every building follows a pattern.

The hospital is always in one area.

Schools are grouped together.

Markets are easy to find.

Suddenly,

the city feels understandable.

Linux is exactly like that.

Your computer is a city.

Its files are buildings.

Its directories are neighborhoods.

Today's chapter is about learning the map.

Once you know the map,

you stop getting lost.

---

# The Biggest Difference from Windows

Many people come to Linux carrying a mental model from Windows.

It looks something like this.

```text
C:\

D:\

E:\

F:\
```

Every disk feels separate.

Every drive has its own beginning.

Linux asks a different question.

Instead of

> "How many drives do you have?"

Linux asks

> **"How should the computer look?"**

That's a very different philosophy.

---

# One Tree

Linux believes something elegant.

Everything should belong to

**one tree.**

Not many trees.

One.

Imagine a giant tree.

```text
                /
                │
      ┌─────────┼─────────┐
      │         │         │
    home       etc       var
      │
      │
   mohit
      │
Documents
Downloads
Projects
```

Notice the top.

There is exactly

one

starting point.

```text
/
```

Everything grows from it.

This single idea explains the entire Linux filesystem.

---

# Meet Root

This symbol

```text
/
```

is called

**the root directory**.

Not because it's the most important folder.

Because it is

the beginning

of the filesystem tree.

Every path you ever use

starts here.

Even if you don't write it.

---

Imagine a real tree.

```text
           ROOT

            │

       Branches

            │

      Smaller Branches

            │

          Leaves
```

Linux directories work exactly like this.

Everything has one ancestor.

Everything connects back

to root.

---

# Mental Model

I don't want you to imagine folders.

I want you to imagine

a tree.

```text
/

├── home

│     └── mohit

│           └── Projects

│                 └── linux-book

│

├── etc

├── usr

├── var

├── bin

├── boot

└── dev
```

Every directory

is simply another branch.

Nothing magical.

Nothing random.

---

# Why Not C:\ ?

That's actually a fascinating question.

Imagine plugging a second hard drive into your computer.

Windows often gives it another drive letter.

```text
C:\

D:\
```

Linux says,

"No."

Instead,

Linux simply attaches

that drive

somewhere

inside the existing tree.

Maybe

```text
/media
```

Maybe

```text
/mnt
```

Maybe somewhere else.

The user doesn't need to care

which physical disk stores the data.

They only care

where it appears

inside the tree.

This idea is one of Linux's greatest strengths.

We'll study mounting in depth later.

For now,

remember this.

> Linux has one filesystem tree.

Not one tree per disk.

---

# Absolute Paths

Suppose someone asks,

> "Where is your project?"

You answer,

```text
/home/mohit/Projects/linux-book
```

Notice something.

The path starts from

```text
/
```

and walks downward.

```text
/

↓

home

↓

mohit

↓

Projects

↓

linux-book
```

That is called

an

**absolute path**.

Because it always starts

from the root.

No ambiguity.

No guessing.

If two engineers on opposite sides of the world use the same machine,

that absolute path refers to the same location.

That's powerful.

---

# Relative Paths

Now imagine you're already here.

```text
/home/mohit
```

Someone asks,

"Where is your project?"

Do you really need to say

```text
/home/mohit/Projects/linux-book
```

again?

No.

You can simply say

```text
Projects/linux-book
```

because everyone already knows

where you're standing.

That's called

a

**relative path**.

It depends on

your current location.

---

# Think Like GPS

Absolute path

is like giving

the complete address.

Relative path

is like saying

> "The shop next door."

Both work.

One depends on context.

The other doesn't.

---

# Where Am I?

Soon you'll learn

```bash
pwd
```

Before memorizing it,

understand the question it answers.

Imagine waking up in an unfamiliar hotel.

Before asking

"Where's breakfast?"

you first ask

> "Where am I?"

Linux thinks the same way.

Every shell always has

a current location.

Before moving,

it must know

where it is.

That simple idea makes commands like `cd`, `pwd`, and relative paths feel obvious instead of magical.

---

# The Home Directory

Let's meet the place where you'll spend most of your life.

```text
/home
```

Think of an apartment building.

```text
home

├── alice

├── bob

├── mohit

└── serveradmin
```

Every user gets

their own room.

Inside yours,

you can create

Documents,

Downloads,

Projects,

Music,

or anything else.

Other users have their own spaces.

This separation is one of the reasons Linux is so comfortable for multi-user systems.

---

# Coffee Break ☕

Have you noticed something?

Linux rarely names directories with marketing language.

It doesn't call them

"Awesome Files."

Or

"System Center."

Or

"Magic Configuration."

Most names are short.

Simple.

Functional.

`bin`

`etc`

`usr`

`var`

Unix inherited a philosophy that names should be practical rather than decorative.

Once you learn them,

they become second nature.

---

# The Most Important Directories

Don't memorize these.

Understand their jobs.

---

## `/home`

People live here.

Your work.

Your code.

Your downloads.

Your documents.

When someone says,

"Never work as root."

this is usually where they expect you to work.

---

## `/bin`

Imagine a toolbox.

Every mechanic keeps frequently used tools nearby.

Linux does the same.

Historically,

`/bin`

stored essential commands

needed for the system to function.

Commands like

```text
ls

cp

mv

cat
```

On many modern distributions these commands are now provided through a merged `/usr` hierarchy, but you'll still encounter `/bin` everywhere in documentation and scripts because of its long history.

---

## `/etc`

This directory has one job.

Configuration.

Think of it as

the control room.

Programs don't store your personal files here.

They store instructions.

Questions like

> Which users exist?

> Which network settings should I use?

> Which services start automatically?

often have answers somewhere inside `/etc`.

When something behaves unexpectedly,

experienced administrators often begin their investigation here.

---

## `/var`

The name comes from

**variable**.

Things that change.

Logs.

Caches.

Mail queues.

Spool files.

Databases.

Imagine a notebook that someone writes in every day.

That's `/var`.

---

## `/tmp`

Temporary files.

Imagine a workbench.

You place tools there while working.

When the job is done,

you clean it.

Many programs use `/tmp` exactly this way.

Never assume files there will live forever.

---

## `/boot`

Everything needed to start the system.

Imagine turning the key in a car.

Something has to happen before the engine begins running.

`/boot`

contains those critical startup pieces.

We won't dive into the boot process yet,

but now you know why this directory exists.

---

## `/dev`

One of the most fascinating directories in Linux.

Printers.

Hard drives.

USB devices.

Terminals.

Many of them appear here as **device files**.

Remember the Linux philosophy from Chapter 1?

> Everything is a file.

This is where you'll start seeing that philosophy become real.

---

## `/proc`

This one surprises everyone.

It looks like a directory.

But much of it doesn't actually exist on disk.

It's generated by the kernel while the system is running.

It's like opening a live dashboard instead of a saved document.

One day you'll run

```bash
cat /proc/cpuinfo
```

and realize you're reading information produced on demand by the kernel.

That's one of those "Linux is beautiful" moments.

---

## `/usr`

Despite the name,

this is **not** "your personal user folder."

Historically, it meant "Unix System Resources" and became the home of most user-space programs, libraries, documentation, and shared resources.

Many beginners assume `/usr` belongs to *them* because of the letters.

It doesn't.

History gave it an unusual name.

---

# Battle Story ⚔

A junior administrator once needed to free disk space.

They saw

```text
/tmp
```

full of files.

Without understanding the directory,

they deleted everything under

```text
/var
```

instead.

The logs disappeared.

Several applications stopped working correctly.

The lesson wasn't

"Don't delete files."

The lesson was

**Know the neighborhood before demolishing buildings.**

Linux rewards understanding.

---

# Linux Philosophy 🐧

Have you noticed a pattern?

Every directory has

one clear responsibility.

That's not an accident.

Unix has always preferred

small,

well-defined purposes.

Instead of one giant folder called

"System Stuff,"

Linux separates responsibilities.

That organization scales beautifully.

---

# Your First Exploration Mission

Open your terminal.

Don't worry about understanding every command yet.

Simply observe.

```bash
pwd
```

Where are you?

Now try

```bash
cd /
```

You've just travelled to the root.

Now look around.

```bash
ls
```

Recognize some of the names from this chapter.

Next,

go home.

```bash
cd ~
```

You've just used a shortcut.

We'll explain `~` fully in the next chapter.

For today,

just notice that Linux brought you back to your home directory.

---

# Future Mohit 💡

There will come a day when you SSH into a production server,

type

```bash
cd /etc
```

without thinking,

open a configuration file,

restart a service,

and solve a problem in minutes.

That confidence begins here,

with understanding that the filesystem is not random.

It is designed.

---

# Interview Corner 🎯

**What is the root directory?**

The top-most directory in the Linux filesystem, represented by `/`.

---

**What is an absolute path?**

A path that starts from the root directory and always points to the same location.

---

**What is a relative path?**

A path interpreted relative to the current working directory.

---

**Where are user files usually stored?**

Inside `/home/<username>`.

---

**Where are configuration files commonly stored?**

Inside `/etc`.

---

# Summary

Today you didn't memorize directories.

You learned a map.

Linux organizes everything as a single tree beginning at `/`.

Directories are neighborhoods with clear responsibilities.

Absolute paths describe a complete route.

Relative paths depend on where you are.

The filesystem is one of Linux's quiet masterpieces:

simple enough to learn,

powerful enough to run the world's largest servers.

---

# Remember One Thing

> **Linux is not a collection of random folders. It is a carefully organized city built around one tree with one root.**

---

# Looking Ahead

Now that you understand **where** everything lives,

the next question is natural:

> **How do I move through this city without getting lost?**

In the next chapter, we'll finally meet some of the commands you've probably seen before—`pwd`, `cd`, `.`, `..`, `~`, and path navigation—but this time they'll feel like directions on a map rather than mysterious incantations.

Because once you know the city,

navigation becomes instinctive.

---

### A Note from Your Co-author

When I first learned Linux, `/etc`, `/usr`, `/var`, and `/proc` felt like arbitrary names I had to memorize.

Now I don't think of them as names.

I think of them as places.

That's the shift I hope this chapter gives every reader.

Once a filesystem becomes a place in your mind instead of a list in your notebook, Linux starts to feel like home.

