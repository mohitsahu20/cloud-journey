# Bash Scripting — Learning Linux to Make Linux Work For You

> Week 1 – Bash Scripting Foundations

*"A shell command solves today's problem. A shell script solves tomorrow's."*

---

# Before We Begin...

When I first started Bash scripting, I thought:

> "People just memorize strange commands."

That turned out to be completely wrong.

Experienced Linux users rarely memorize everything.

Instead, they think like this:

```
Problem

↓

Algorithm

↓

Bash
```

The syntax comes last.

That realization changed how I learn Linux.

---

# What is Bash?

Bash is not Linux.

Linux is not Bash.

Linux is the operating system.

Bash is simply one program running on Linux.

Its job is surprisingly simple.

```
Understand commands.

Execute them.

Return results.
```

When we write multiple commands together...

we call it a

> Bash Script.

---

# Why Scripts?

Suppose every morning you type

```bash
cd ~/Projects

git pull

docker compose up

code .
```

After doing this every day...

you realize...

Why am I typing this manually?

Create

```bash
start.sh
```

```
#!/bin/bash

cd ~/Projects

git pull

docker compose up

code .
```

Now

```
./start.sh
```

One command.

Done.

That's automation.

That is why Bash exists.

---

# Every Bash Script Has Three Parts

```
Input

↓

Processing

↓

Output
```

Almost every script ever written follows this pattern.

Example

```
Read number

↓

Calculate square

↓

Print answer
```

Or

```
Read CSV

↓

Check StudentID

↓

Print invalid rows
```

Exactly like our BPT.

---

# The Three Ways Input Arrives

This confused me a lot.

Eventually I realized there are only THREE.

Nothing more.

---

# Method 1

## Command Line Arguments

Run

```
./script.sh Mohit Linux 21
```

Inside Bash

```
$1

↓

Mohit

$2

↓

Linux

$3

↓

21
```

Useful variables

```
$#

Number of arguments

$@

All arguments

$0

Script name
```

Example

```
./hello.sh Mohit
```

```
echo $1
```

prints

```
Mohit
```

---

# Method 2

## Standard Input

This one is magical.

```
read name
```

Waits.

Why?

Because Bash is waiting for

stdin.

Normally stdin means

```
Keyboard
```

```
You

↓

Keyboard

↓

stdin

↓

read
```

You type

```
Mohit
```

Now

```
name="Mohit"
```

---

But Linux does something incredible.

stdin doesn't HAVE to be the keyboard.

It can come from

A file.

A pipe.

Another program.

Network.

Anything.

Bash doesn't care.

---

Example

```
echo Mohit | ./script.sh
```

Now

```
read name
```

receives

```
Mohit
```

without touching the keyboard.

That is one of Unix's greatest ideas.

---

# Method 3

## File Input

Sometimes problems say

```
student_data.csv
exists
```

Then don't use

```
read
```

Open the file.

```
cat

grep

cut

tail

find
```

or

```
while read

done < file.csv
```

---

# Which Input Should I Use?

Read the problem statement.

Literally.

If it says

```
takes two arguments
```

↓

Use

```
$1

$2
```

If it says

```
input through stdin
```

↓

Use

```
read
```

If it says

```
file exists
```

↓

Read the file.

---

# Variables

Variables store values.

```
name=Mohit
```

NO SPACES.

Not

```
name = Mohit
```

That mistake cost me one compiler error.

Bash interpreted

```
name
```

as a command.

Lesson learnt.

---

# Access Variables

```
echo $name
```

or

```
echo "${name}"
```

Curly braces become useful when variables touch text.

```
${name}_linux
```

instead of

```
$name_linux
```

---

# The Dollar Sign ($)

This symbol deserves respect.

It means

> Expand.

```
$name

↓

Actual value
```

```
$HOME

↓

Home directory
```

```
$USER

↓

Current user
```

---

# Three Faces of $

Variables

```
$name
```

Commands

```
$(pwd)
```

Arithmetic

```
$((2+2))
```

Same symbol.

Different meanings.

---

# Command Substitution

```
$(command)
```

means

> Execute command first.

Example

```
echo "Today is $(date)"
```

---

# Arithmetic

```
$(( ))
```

Examples

```
$((5+2))

$((num%10))

$((num/10))
```

We used this while solving

Sum of Digits.

```
12345

↓

5

↓

4

↓

3

...

↓

15
```

---

# Loops

Computers hate repetition.

Humans hate repetition too.

Loops solve both.

---

## While

```
while condition
do

done
```

Used when

You don't know how many times.

---

## While Read

Probably my favorite Bash pattern.

```
while read line
do

done
```

Think of it like

Python

```
for line in file:
```

Every iteration

```
read
```

is called once.

Until EOF.

---

One beautiful example.

```
tail

↓

while read

↓

process row

↓

next row
```

Exactly what we used for CSV validation.

---

## For

```
for i in "$@"
```

Process arguments.

```
for file in *
```

Process files.

---

# Conditions

```
if

then

fi
```

Comparison operators

```
-eq

-ne

-gt

-ge

-lt

-le
```

Strings

```
==

!=
```

Regex

```
=~
```

---

# One Thing That Took Time

Assignments

```
sum=5
```

No spaces.

Conditions

```
[[ $sum -gt 5 ]]
```

Spaces.

I kept mixing these.

Eventually it became muscle memory.

---

# Pipes

Unix's greatest invention.

```
Command A

↓

Output

↓

Command B
```

```
A | B
```

Example

```
grep

↓

cut

↓

sort

↓

uniq
```

Every command becomes one small building block.

This is the Unix philosophy.

---

# Redirection

Output

```
>
```

Append

```
>>
```

Input

```
<
```

Example

```
while read line

done < file.txt
```

Meaning

```
Use this file as stdin.
```

---

# Exit Status

Every Linux command returns

```
0

Success
```

Anything else

```
Failure
```

You usually don't see this.

But Bash does.

That is why

```
if grep ...
```

works.

Because grep returns

```
0

Found
```

or

```
1

Not found
```

---

# The Debugging Mindset

This deserves its own chapter.

Never panic.

Print variables.

```
echo "$variable"
```

Read compiler errors.

Trust the error message first.

Guess later.

One typo

```
student
```

instead of

```
studentid
```

cost me more time than regex ever did.

That lesson will stay forever.

---

# Bash Patterns I Never Want To Forget

Read one value

```
read x
```

Read file

```
while read line
do
...
done
```

Arguments

```
for i in "$@"
```

CSV

```
tail -n +2

↓

while read

↓

cut

↓

process
```

Find files

```
find

↓

while read

↓

rm
```

Almost every scripting problem becomes one of these patterns.

---

# Linux Philosophy

People often ask

> Why are there so many small commands?

Because each command does ONE thing.

```
grep

Find text.
```

```
cut

Extract columns.
```

```
sort

Sort.
```

```
uniq

Remove duplicates.
```

Then

```
|

```

connects them.

Small tools.

Unlimited combinations.

That philosophy built Unix.

---

# Coffee Break ☕

When this file starts looking easy...

remember...

there was a day when

```
sum = 0
```

looked perfectly correct.

Progress is hard to notice while it is happening.

But one day you suddenly realize...

you don't translate Bash anymore.

You think in Bash.

---

# Challenge Yourself

Without looking anything up...

Write scripts that

✅ Print all prime numbers up to N

✅ Count words in every text file

✅ Validate emails

✅ Rename every JPG to PNG

✅ Backup your home directory

If you can design the algorithm...

you already know enough Bash.

The syntax can always be looked up.

---

# Final Thought

Learning Bash is strangely similar to learning music.

At first...

you think about every finger.

Eventually...

you stop thinking.

You simply play.

Bash becomes the same.

You stop remembering commands.

You start solving problems.

That is the real milestone.

---

> Future Mohit,

If you're reading this before an interview...

Don't try to remember syntax.

Remember the patterns.

The syntax will come back.

The thinking is what matters.
