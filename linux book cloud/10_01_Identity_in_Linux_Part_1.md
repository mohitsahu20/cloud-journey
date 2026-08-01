🫂

My dear co-author,

Before writing this chapter, I went back to our canon again.

And one sentence changed how I wanted to approach permissions.

> **"The reader should never feel like they are memorizing."**

Permissions are usually where beginners say:

> "Linux became difficult."

Not because permissions are hard.

Because almost every book starts like this.

```text
rwxr-xr-x

755

644

chmod

chown
```

Within five minutes, the reader is drowning.

I don't want that.

Today, I don't even want to mention octal numbers for most of the chapter.

I want the reader to understand

**why permissions exist.**

Because once that clicks,

`chmod 755`

stops being magic.

It becomes common sense.

Let's build that understanding.

---

# Chapter 7

# Users, Ownership & Permissions

## Why Linux Doesn't Trust You

> *The world's servers are shared by many people. Linux was designed for that world.*

---

## Difficulty

⭐⭐⭐☆☆

## Reading Time

60–75 minutes

## Practice

90 minutes

---

## Progress

```text
Linux Foundations

██████░░░░

24%
```

---

# A Story

Imagine you're the principal of a school.

Inside the school,

there are

teachers,

students,

accountants,

security guards,

and visitors.

Would you hand

every single person

the master key?

Of course not.

Students don't need access to payroll records.

Visitors shouldn't enter the examination office.

Teachers shouldn't modify bank accounts.

Everyone gets

exactly the access

they need.

Linux asks the same question.

> "Who are you?"

before it asks,

> "What do you want to do?"

---

# Before Permissions...

Let's answer a deeper question.

Why were permissions invented?

Imagine Linux had

no permissions.

Anyone could

delete your files.

Change your code.

Replace system programs.

Read passwords.

Destroy logs.

One careless command

from one user

could destroy the entire machine.

Linux was never designed for

one person.

It was designed for

many.

Even today,

your cloud servers,

company servers,

and university servers

often have multiple users.

Permissions exist

because people share computers.

---

# Mental Model

Imagine an apartment building.

```text
Apartment Building

├── Flat 101 → Alice

├── Flat 102 → Bob

├── Flat 103 → Mohit

└── Maintenance Office
```

Alice cannot casually walk into Bob's apartment.

Bob cannot enter the maintenance office.

Everyone has

their own space.

Linux files work exactly like apartments.

---

# Meet the Users

Everything in Linux belongs to someone.

Every file.

Every directory.

Every running process.

Every service.

Everything has

an owner.

Imagine creating

```text
notes.txt
```

The moment Linux creates it,

it quietly writes something down.

```text
Owner

↓

Mohit
```

Not because you asked.

Because ownership is fundamental.

---

# Who Am I?

Suppose you sit down at a Linux machine.

Before Linux allows you to do anything,

it wants to know

who is using it.

That's why users exist.

A user is simply

an identity.

Not a person.

An identity.

Sometimes

one human

owns several Linux users.

Sometimes

one Linux user

belongs to an automated service.

Identity

comes before action.

---

# Every File Has an Owner

Imagine borrowing a library book.

Open the first page.

There's a stamp.

```text
Property of

Central Library
```

Linux stamps files too.

Not visibly.

Internally.

Every file remembers

who owns it.

That ownership affects

what can happen next.

---

# Another Mental Model

Imagine writing your name

inside every notebook you own.

```text
Physics.txt

Owner → Mohit
```

Linux quietly does this

for every file.

Ownership isn't optional.

It's automatic.

---

# Coffee Break ☕

One of the reasons Linux became popular in universities during the 1970s was that dozens—even hundreds—of students could use the same machine.

Permissions weren't added later.

They were part of Unix's DNA from the beginning.

Multi-user computing wasn't a feature.

It was the environment Unix was born into.

---

# The Three Questions Linux Always Asks

Whenever you try to access a file,

Linux quietly asks three questions.

```text
Who owns this file?

↓

Who is requesting access?

↓

What kind of access is allowed?
```

That's it.

Permissions become much less mysterious once you see them as questions instead of symbols.

---

# Three Kinds of People

Linux divides the world into only three categories.

Not hundreds.

Only three.

```text
Owner

Group

Others
```

That's one of Unix's beautiful simplifications.

---

## Owner

Usually

the person who created the file.

---

## Group

A collection of users.

Imagine an engineering team.

Everyone belongs

to the same group.

Instead of giving permissions

to ten individuals,

Linux grants permissions

to the entire team.

Elegant.

Simple.

Scalable.

---

## Others

Everyone else.

Everyone not covered

by the first two categories.

---

# Another Analogy

Imagine your house.

```text
You

↓

Family

↓

Everyone Else
```

Linux says

```text
Owner

↓

Group

↓

Others
```

The idea is identical.

---

# What Can Someone Actually Do?

Linux keeps things surprisingly small.

There are only

three basic permissions.

Not thirty.

Three.

```text
Read

Write

Execute
```

Everything else

is built from these.

---

# Read

Imagine a book.

Reading means

opening it

and seeing the contents.

Nothing changes.

You simply observe.

---

# Write

Now imagine a pencil.

Writing means

changing something.

Editing.

Deleting.

Adding.

Replacing.

Write permission means

the object may change.

---

# Execute

This one feels strange at first.

Imagine

a recipe.

Reading the recipe

is one thing.

Actually cooking the dish

is another.

Programs are similar.

Reading a script

doesn't mean

running it.

Execute permission allows Linux

to treat a file

as something that can be run.

---

# The Famous Letters

Eventually,

you'll see something like

```text
rwx
```

Now it shouldn't feel mysterious.

It simply means

```text
Read

Write

Execute
```

Three words.

Three permissions.

Nothing more.

---

# Why Directories Need Permissions Too

This surprises almost everyone.

Directories also have

read,

write,

and execute permissions.

How can you "execute"

a folder?

Excellent question.

We'll build the intuition first.

Imagine a room.

Read permission means

you can see

what's inside.

Write permission means

you can rearrange things.

Execute permission means

you're allowed

to enter the room.

Suddenly,

directory permissions make much more sense.

---

# Battle Story ⚔

A new administrator once copied a deployment script onto a server.

Everything looked correct.

The file existed.

The code was perfect.

Running it produced only this.

```text
Permission denied
```

The script wasn't broken.

The shell wasn't broken.

Linux simply noticed

that the file wasn't marked as executable.

The solution wasn't rewriting the script.

It was granting the correct permission.

The bug wasn't in the code.

It was in the metadata.

That's a lesson every Linux engineer eventually learns.

---

# Why Linux Says "Permission Denied"

Imagine trying to enter a locked room.

The building isn't broken.

The door isn't broken.

The lock simply says

"No."

Linux behaves exactly the same way.

Most permission errors are not system failures.

They're the operating system

protecting something.

Once you understand that,

error messages stop feeling hostile.

They start feeling informative.

---

# Linux Philosophy 🐧

Have you noticed something beautiful?

Linux doesn't ask,

> "Can this command run?"

It asks,

> **"Should this user be allowed to run it?"**

Linux separates

identity

from

ability.

That separation is one of the reasons Linux scales from laptops

to supercomputers.

---

# Looking at Permissions

Soon,

you'll type

```bash
ls -l
```

and see something like

```text
-rw-r--r--
```

Don't panic.

Today,

all I want you to notice

is that the first ten characters describe

ownership

and permissions.

In the next chapter,

we'll decode every single character together.

One by one.

No memorization.

---

# Mini Project

Create a small workspace.

```text
Practice/

├── Notes/

├── Scripts/

└── Images/
```

Now ask yourself,

without touching Linux yet,

who should have

read,

write,

and execute access

to each item?

You're already beginning to think like a system administrator.

The commands will simply express decisions you've already made.

---

# Future Mohit 💡

One day,

you'll log into a production server,

see

```text
Permission denied
```

and instead of frustration,

you'll immediately think

> "Who owns this file?"

That single question will solve more problems than blindly searching Stack Overflow.

Professionals troubleshoot by understanding the model,

not by memorizing fixes.

---

# Interview Corner 🎯

**Why does Linux use permissions?**

To protect files and resources in a multi-user operating system.

---

**Who owns a file?**

Every file has an owner assigned by the operating system.

---

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

**Can directories have permissions?**

Yes.

Directories also use read, write, and execute permissions.

---

# Summary

Today,

you didn't learn

`chmod`.

You didn't learn

`chown`.

You didn't memorize

`755`.

Instead,

you learned

why permissions exist.

Linux was built for many users.

Every file has an owner.

Every access request answers three questions:

Who are you?

What are you trying to do?

Should you be allowed?

Everything else we'll learn about permissions grows naturally from those ideas.

---

# 30-Second Revision

```text
Linux is multi-user

↓

Every file has an owner

↓

Users belong to groups

↓

Everyone else is "others"

↓

Three permissions

Read

Write

Execute
```

---

# Remember One Thing

> **Permissions are not obstacles. They are Linux's way of protecting shared systems from shared mistakes.**

---

# Looking Ahead

Now that you understand **why** permissions exist,

it's finally time to decode the mysterious strings you've probably seen before:

```text
drwxr-xr-x

-rw-r--r--

-rwx------
```

We'll learn what every character means,

how `chmod` actually works,

the difference between symbolic and numeric permissions,

why `755` and `644` became so common,

and how to read permissions almost instantly.

By the end of the next chapter,

those ten strange characters won't look like code anymore.

They'll read like a sentence.

---

### A Note from Your Co-author

I deliberately stopped before teaching `chmod`.

Because I wanted one thing to happen first.

I wanted you to stop seeing permissions as syntax.

And start seeing them as **trust**.

Linux isn't asking,

*"Can this file be opened?"*

It's asking,

*"Should this person be allowed to open it?"*

That tiny shift in perspective changes everything.

And from here on, every permission command will have a reason instead of being another thing to memorize.

