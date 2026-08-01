

While rereading, one sentence from our canon stayed with me:

> **Teach understanding before memorization.** 

That completely changes how this chapter should begin.

Almost every Linux book starts with:

```bash
whoami
id
groups
```

No.

That's like teaching someone car keys before explaining why cars have drivers.

This chapter is not about commands.

It's about **identity**.

Because Linux asks one question before almost everything else.

> **"Who are you?"**

And once you understand why,

every command in this chapter becomes obvious.

---

# Chapter 10

# Identity in Linux

## Users, Groups & Becoming Someone

> *Before Linux decides what you may do, it first decides who you are.*

---

## Difficulty

⭐⭐⭐☆☆

## Reading Time

75 Minutes

## Practice

90 Minutes

---

## Progress

```text
Linux Foundations

██████████░░

40%
```

---

# A Story

Imagine you walk into an airport.

The security officer doesn't begin by asking,

> "Which gate are you going to?"

Instead,

they ask,

> "May I see your identity?"

Only after they know **who you are**

do they decide

where you may go.

Linux behaves in exactly the same way.

Before you open a file,

before you start a process,

before you install software,

before you delete anything,

Linux silently asks one question.

> **Who is making this request?**

Today's chapter is about that question.

---

# Before Users...

Let's imagine a different world.

Imagine there were

no usernames.

No passwords.

No identity.

One giant computer

shared by hundreds of people.

Alice edits a file.

Bob deletes it.

Charlie changes passwords.

David installs malware.

Nobody knows

who did what.

Chaos.

Linux wasn't designed for one person sitting alone with a laptop.

It inherited ideas from Unix,

which was built for universities and research labs,

where many people shared one machine.

Identity wasn't optional.

It was the foundation.

---

# Mental Model

Imagine a company office.

```text
Office

├── Reception

├── HR

├── Finance

├── Engineering

└── Server Room
```

Every employee wears an ID card.

The building doesn't remember faces.

It checks

identity.

Linux is the same.

It doesn't know "Mohit."

It knows

a user account.

---

# What Is a User?

A beginner usually says,

> "A user is a person."

Sometimes.

But not always.

In Linux,

a user is better understood as

an **identity**.

Sometimes that identity belongs to a human.

Sometimes it belongs to a web server.

Sometimes to a database.

Sometimes to a backup service.

Identity

is more important

than the person.

---

# Humans and Service Accounts

Imagine a restaurant.

There are customers.

Waiters.

Chefs.

Cashiers.

Each has a role.

Linux creates similar identities.

Some users log in with keyboards.

Others never log in at all.

For example,

a web server like Nginx often runs as its own dedicated user.

Not because Nginx has feelings.

Because Linux wants to isolate responsibilities.

If something goes wrong,

the damage stays limited.

Identity creates boundaries.

---

# Coffee Break ☕

Many Linux distributions create dozens of users during installation.

You may only ever log in as your own account,

but behind the scenes,

system services often run under dedicated identities.

That's why commands that list users often show far more names than the number of humans using the machine.

---

# Meet Yourself

Every Linux journey begins with a simple question.

Who am I?

Linux answers with

```bash
whoami
```

Notice how human that sounds.

Not

```bash
current_user_identifier
```

Just

```bash
whoami
```

It's almost conversational.

Run it.

Linux replies with your current username.

Not your full name.

Not your email.

Your identity on this system.

---

# Identity vs Name

Imagine two people named Rahul.

Names can collide.

Identity cannot.

Linux therefore stores something deeper.

Every user has

a unique numeric identifier.

The **User ID**, or **UID**.

Think of it as an employee number.

The badge says "Mohit."

The database stores Employee #1001.

Programs rely on the number.

Humans prefer the name.

---

# Meet `id`

Now ask Linux a richer question.

```bash
id
```

Instead of only telling you who you are,

Linux reveals your identity card.

Typical output includes

* your username,
* your UID,
* your primary group,
* your group ID (GID),
* and any additional groups you belong to.

Don't worry about memorizing the format today.

Understand the idea.

Linux is showing

**who you are in its world.**

---

# Why Numbers?

Imagine a company changes someone's name after marriage.

Should every payroll record,

every access log,

every HR document,

every email archive,

be rewritten?

No.

The employee number stays the same.

Linux uses UIDs for exactly this reason.

Names are convenient.

Numbers are stable.

---

# Groups

Now imagine a school.

Instead of granting permission to

every teacher individually,

the principal creates

one group.

```text
Teachers
```

Anyone inside that group

automatically receives the same access.

Linux borrowed exactly this idea.

Groups exist

so permissions can be managed collectively.

---

# Mental Model

```text
Users

├── Mohit

├── Aisha

├── Rahul

└── Priya

          │

          ▼

       Developers
```

Instead of configuring

four people separately,

Linux configures

one group.

That makes administration dramatically simpler.

---

# Why Groups Matter

Imagine your company hires

twenty new developers.

Without groups,

you would manually grant permissions

twenty times.

With groups,

you simply add each new developer

to the Developers group.

The permissions were already there.

Groups scale.

---

# Seeing Your Groups

Linux provides another simple command.

```bash
groups
```

This answers

> "Which teams do I belong to?"

A single user can belong to many groups.

For example,

someone might be part of

* developers,
* docker,
* sudo,
* audio.

Identity isn't one-dimensional.

---

# The Administrator

Every society has

someone

with greater responsibility.

Linux has one too.

Historically,

that identity is called

```text
root
```

Not because it's "the best."

Because it sits

at the root

of administrative authority.

The root user can bypass many normal restrictions.

That power is incredibly useful.

And incredibly dangerous.

---

# Why Not Work as Root?

Imagine carrying

the master key

for an entire building.

Every door opens.

Convenient?

Absolutely.

Risky?

Even more.

One accidental mistake

can affect the whole system.

That's why modern Linux systems encourage you to work as a normal user

and temporarily gain administrative privileges only when needed.

We'll meet `sudo` properly later.

For now,

remember the principle.

Power should be used deliberately,

not constantly.

---

# Battle Story ⚔

A junior administrator logged into a test server as `root`.

They intended to remove a temporary directory.

They typed a command from the wrong location.

The command succeeded perfectly.

The problem wasn't Linux.

The problem was unlimited authority combined with one small mistake.

That story has been repeated in countless organizations.

The lesson isn't

"Never be root."

It's

"Respect the power of administrative identity."

---

# Creating Users

Soon,

you'll need new identities.

Maybe for a colleague.

Maybe for a service.

Linux provides tools like

```bash
useradd
```

and

```bash
usermod
```

to create and modify users.

Don't think of these as "account commands."

Think of them as

creating and managing identities.

That mental model will stay useful far beyond this chapter.

---

# Passwords

A user without authentication

is like an employee badge with no security check.

Linux associates passwords

with identities,

not with files.

That's why changing a password changes

how someone proves

who they are,

not

what files exist.

The command you'll eventually use is

```bash
passwd
```

The name is wonderfully direct.

Password.

---

# Linux Philosophy 🐧

Notice something beautiful.

Linux separates

**identity**

from

**permission**.

Today's chapter is only about identity.

The next chapter asks a different question.

> "Now that Linux knows who you are...

what are you allowed to do?"

That separation keeps the system simple,

flexible,

and secure.

---

# Mini Project

Explore your own identity.

Run:

```bash
whoami
id
groups
```

Write down:

* your username,
* your UID,
* your primary group,
* and every additional group.

Then ask yourself:

> "Why would Linux store all of this?"

Don't rush to the next command.

Think about the design.

Understanding that design is worth more than memorizing output.

---

# Future Mohit 💡

Months from now,

you'll SSH into a cloud server.

The first thing you'll check won't be CPU.

It won't be RAM.

It will often be

> "Which user am I?"

Because experienced administrators know

that identity changes everything else.

---

# Interview Corner 🎯

**What is a Linux user?**

A Linux user is an identity recognized by the operating system. It may represent a person or a service.

---

**What does `whoami` show?**

The current username.

---

**What does `id` show?**

Information about your user identity, including UID, GID, and group memberships.

---

**Why are groups used?**

To manage permissions collectively instead of configuring each user individually.

---

**Who is the root user?**

The administrative account with broad system privileges.

---

# Summary

Today,

you didn't learn account management.

You learned identity.

Linux doesn't begin with files.

It doesn't begin with commands.

It begins by asking

who is making the request.

Users provide identity.

Groups organize identities.

UIDs make identities unique.

And the root account represents administrative authority.

Everything related to permissions begins here.

---

# 30-Second Revision

```text
User

↓

Identity

↓

UID

↓

Groups

↓

Permissions (next chapter)
```

```text
whoami  → Who am I?

id       → My identity card

groups   → My teams

root     → Administrator
```

---

# Remember One Thing

> **Linux doesn't trust names. It trusts identities.**

---

# Official References

As our project canon encourages, it's worth learning to rely on primary sources whenever possible. For this chapter, the best references are:

* `man 1 whoami`
* `man 1 id`
* `man 1 groups`
* `man 8 useradd`
* `man 8 usermod`
* `man 1 passwd`

Reading the manual pages alongside this chapter will help reinforce both the concepts and the practical usage.

---

## A Note from Your Co-author

I think this chapter quietly changes the way someone sees Linux.

Beginners often think:

> "I'm using the computer."

Linux thinks:

> "An identity is making a request."

That's a subtle difference.

But it's the foundation of multi-user systems, servers, cloud infrastructure, and everything we'll build from here.

The next chapter is where that identity finally meets authority.

We'll ask the question Linux has been waiting to ask all along:

> **"Now that I know who you are... what are you allowed to do?"**

