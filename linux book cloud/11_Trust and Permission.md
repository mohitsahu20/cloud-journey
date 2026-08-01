🫂

My dear co-author,

Before writing, I mentally returned to our project canon and blueprint again.

One sentence kept echoing:

> **"Don't explain commands. Explain why they exist."**

So I decided something.

This chapter will **not** begin with `chmod`.

It will begin with **trust**.

Because permissions are not about files.

They're about trust.

And Linux is one of the most careful systems ever built when it comes to trust.

Let's continue our journey.

---

# Chapter 11

# Trust

## Understanding Linux Permissions

> *Every permission is a decision. Linux simply remembers those decisions.*

---

## Difficulty

⭐⭐⭐⭐☆

## Reading Time

90 Minutes

## Practice

2 Hours

---

## Progress

```text id="l1d4pk"
Linux Foundations

███████████░

44%
```

---

# A Story

Imagine you're given the keys to a building.

Not just any building.

A research laboratory.

Inside are

millions of dollars worth of equipment,

years of research,

private information,

and hundreds of people working every day.

Would you hand

every visitor

the master key?

Of course not.

Some people need

one room.

Some need

an entire floor.

Some only need

to read documents.

Others must be able

to modify them.

Trust

is never equal.

Linux understands this better than almost every operating system.

---

# Before Permissions...

Let's imagine Linux without them.

Alice writes her thesis.

Bob accidentally deletes it.

Charlie replaces system programs.

David edits everyone's files.

One mistake.

One malicious user.

One careless command.

The machine becomes unusable.

Permissions weren't invented

to make Linux difficult.

They were invented

to make Linux survivable.

---

# The Three Questions

Whenever you touch a file,

Linux silently asks

three questions.

```text id="fj0dpa"
Who are you?

↓

What do you want to do?

↓

Should I allow it?
```

Everything else in this chapter

comes from these three questions.

---

# Remember Identity?

In the previous chapter,

Linux learned

who you are.

Today,

it uses that identity.

Users.

Groups.

Root.

UIDs.

All of them now have

a purpose.

Identity without permissions

is meaningless.

Permissions without identity

are impossible.

The two chapters

belong together.

---

# Three Types of People

Linux simplifies the world.

Every request comes from

one of only

three categories.

```text id="owj2rm"
Owner

Group

Others
```

No matter how large the system becomes,

Linux always starts here.

---

# Mental Model

Imagine your own house.

```text id="dkz7hq"
You

↓

Family

↓

Everyone Else
```

Now replace those words.

```text id="w9v31d"
Owner

↓

Group

↓

Others
```

The idea

is identical.

---

# Three Types of Actions

Now Linux asks another question.

What exactly

does this person want to do?

Surprisingly,

almost everything

reduces to three actions.

```text id="r5lhg9"
Read

Write

Execute
```

Three permissions.

Three identities.

That's the entire foundation.

---

# Read

Imagine a diary.

Read permission means

you may open it

and look inside.

Nothing changes.

You simply observe.

Knowledge flows

toward you.

---

# Write

Now imagine

a pencil.

Write permission means

you may change

what already exists.

You may edit.

Delete.

Append.

Replace.

Writing

changes reality.

---

# Execute

This permission confused me

the first time I learned Linux.

Imagine

a recipe.

Reading the recipe

isn't the same thing

as cooking the meal.

Programs are similar.

Reading a script

is not

running the script.

Execute permission

allows Linux

to treat a file

as something that can be performed.

---

# Coffee Break ☕

One of the reasons Linux security is so strong is that

a downloaded file

does **not**

automatically become executable.

You can read it.

Copy it.

Move it.

But Linux asks you

to explicitly decide

whether it should be allowed to run.

That tiny design choice

has prevented countless accidents.

---

# The Famous String

Sooner or later,

you'll see something like this.

```text id="x7cp91"
-rwxr-xr--
```

At first,

it looks like secret code.

It isn't.

It's simply

a compact sentence.

Let's decode it

slowly.

---

# The First Character

Look only

at the very first character.

```text id="br4s5y"
-rwxr-xr--
↑
```

That character

describes

what kind of object this is.

Common values include

```text id="dfi0tl"
-  Regular File

d  Directory

l  Symbolic Link
```

Notice how

permissions haven't even started yet.

The first character

describes

the object itself.

---

# The Next Nine Characters

Now ignore

the first character.

Focus here.

```text id="0v73pr"
rwxr-xr--
```

Split it

into groups of three.

```text id="ynv5vj"
rwx

r-x

r--
```

Suddenly,

everything becomes readable.

First group

belongs to

Owner.

Second group

belongs to

Group.

Third group

belongs to

Others.

---

# Reading One Group

Suppose you see

```text id="6u0l5v"
rw-
```

Read it

like a sentence.

```text id="mp5hh5"
Read ✔

Write ✔

Execute ✘
```

Nothing mysterious.

Linux simply removed

the missing permission.

---

# Another Example

```text id="ydx8dz"
r-x
```

means

```text id="sy59kj"
Read ✔

Write ✘

Execute ✔
```

Again,

don't memorize.

Translate.

---

# The Mental Model

Imagine three switches.

```text id="i8b8vf"
Read

Write

Execute
```

Linux turns

each switch

on

or

off.

The string merely shows

which switches

are currently enabled.

---

# Why Directories Use Execute

This feels strange

until you picture a room.

Imagine

a room

with a glass wall.

You can see

everything inside.

That's

Read.

Now imagine

the door

is locked.

You cannot

enter.

That's

Execute missing.

For directories,

Execute

means

you're allowed

to enter

and access items inside.

That tiny idea

makes directory permissions

much easier to understand.

---

# Reading Permissions Like English

Suppose we have

```text id="44ezaw"
-rwxr-x---
```

Read it

slowly.

Regular file.

Owner:

Read,

Write,

Execute.

Group:

Read,

Execute.

Others:

Nothing.

Once you stop seeing symbols,

you begin seeing sentences.

---

# Battle Story ⚔

A deployment script

worked perfectly

on the developer's laptop.

After uploading it

to the production server,

Linux replied

only with

```text id="bxlujlwm"
Permission denied
```

The code wasn't wrong.

The server wasn't broken.

The file simply

didn't have

Execute permission.

One tiny missing permission

prevented

an entire deployment.

The solution

took one command.

Understanding

took much longer.

---

# Symbolic Permissions

Humans think

in words.

Linux allows that.

Instead of numbers,

you can describe permissions

symbolically.

You'll meet letters like

```text id="3f8r0d"
u

g

o

a
```

representing

User,

Group,

Others,

and All.

Combined with

```text id="hax5y9"
+

-

=
```

they become

a simple language.

We'll use them with

```bash id="4j1s4n"
chmod
```

---

# Numeric Permissions

Computers love numbers.

Humans often prefer

words.

Linux supports both.

Eventually,

you'll encounter

```text id="hsm8gv"
755

644

700

600
```

These aren't magic codes.

They're simply

another way

to describe

the same permission switches.

We'll build the intuition

instead of memorizing them.

---

# Understanding 7

Imagine

three switches.

```text id="kg3n5a"
Read

Write

Execute
```

All three

are enabled.

Linux represents that

with

```text id="sxb9fc"
7
```

Not because seven is special.

Because of binary.

Don't worry.

We'll explore the mathematics gently.

For now,

remember only this.

Seven means

everything.

---

# Common Patterns

Why do you keep seeing

```text id="hdhycw"
755
```

and

```text id="4b1ovg"
644
```

on servers?

Because experience

showed these combinations

fit many situations.

Not because Linux requires them.

Understanding

comes before

memorizing patterns.

---

# Meet chmod

Finally,

the command everyone expects.

```bash id="9eh1c6"
chmod
```

Its name means

**change mode.**

Mode

simply refers

to the permission settings.

It doesn't create trust.

It records

your decision

about trust.

---

# Mental Model

Imagine a manager

changing access cards.

They aren't

changing the employee.

They're changing

what the employee

may do.

`chmod`

works the same way.

---

# Linux Philosophy 🐧

Notice something elegant.

Linux never says

> "This file is safe."

Instead,

it asks,

> **"Safe for whom?"**

Security isn't absolute.

It's contextual.

That's one reason Linux scales

from personal laptops

to the world's largest supercomputers.

---

# Mini Project

Create a file

called

```text id="d7lxw5"
deploy.sh
```

Look at its permissions.

Change them.

Read them.

Translate them

back into English.

Don't stop

when the command works.

Stop

when the permission string

feels like a sentence.

That's the real milestone.

---

# Future Mohit 💡

Months from now,

you'll SSH into a production server,

run

```bash id="pg7a6l"
ls -l
```

and instantly notice

that one file

is executable,

another isn't,

a directory allows traversal,

and a configuration file

is writable only by its owner.

You won't be reading symbols anymore.

You'll be reading intent.

---

# Interview Corner 🎯

**What are the three permission categories?**

Owner,

Group,

Others.

---

**What are the three basic permissions?**

Read,

Write,

Execute.

---

**What does the first character of `ls -l` output represent?**

The file type.

---

**What does Execute mean for a directory?**

Permission to enter and access it.

---

**What does `chmod` do?**

Changes the permission mode of a file or directory.

---

**Why are numeric permissions used?**

They provide a compact way to represent the same permission settings.

---

# Summary

Today,

you learned to read

Linux permissions

as a language.

Three identities.

Three permissions.

Nine characters.

One elegant system.

Permissions aren't random symbols.

They're Linux's way of recording

who may do what.

And once you understand

that language,

those mysterious strings

become surprisingly easy to read.

---

# 30-Second Revision

```text id="m8bchx"
Owner

Group

Others

↓

Read

Write

Execute
```

```text id="4hjlwm"
-rwxr-xr--

↓

File Type

↓

Owner

↓

Group

↓

Others
```

```text id="mw9lp4"
chmod

↓

Change Permission Mode
```

---

# Remember One Thing

> **Permissions are not about files. They are about trust between identities and actions.**

---

# Looking Ahead

We've now answered two questions.

**Who are you?**

and

**What are you allowed to do?**

One final piece remains.

> **Who actually owns this file, and how can ownership itself be changed?**

In the next chapter, we'll explore ownership in depth:

* `chown`
* `chgrp`
* `umask`
* default permissions
* sticky bit
* SUID
* SGID
* ACLs

These concepts complete Linux's security model and explain why systems remain organized even when thousands of users share the same machine.

---

## A Note from Your Co-author

This chapter wasn't really about `chmod`.

It was about something much older than computers.

**Trust.**

Every society has to answer the same question:

> *Who should be allowed to do what?*

Linux answers it with remarkable simplicity.

Three kinds of people.

Three kinds of actions.

Everything else is just a careful expression of that one idea.

And I think that's one of the reasons Unix has remained beautiful for over fifty years.

