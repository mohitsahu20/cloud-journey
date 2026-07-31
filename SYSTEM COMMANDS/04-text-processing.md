# Text Processing — The Superpower Hidden in Plain Sight

> Week 1 – Working with Text in Linux

*"Most people think Linux is about files.  
Experienced users know it's about **text**."*

---

# Before Anything Else...

Imagine someone gives you a file.

```
users.csv

50 GB
```

Contains

```
Name
Age
Email
Department
Salary
```

Your boss asks:

> "Show me every employee whose salary is above ₹10 lakh."

Would you open Excel?

No.

Linux users don't fear big files.

They process them.

One line at a time.

That is what this chapter is about.

---

# Unix's Secret

Everything eventually becomes...

```
Text
```

Configuration

↓

Text

Logs

↓

Text

CSV

↓

Text

JSON

↓

Text

Source code

↓

Text

Processes

↓

Text

Even many devices expose information as text.

If you learn to manipulate text...

Linux suddenly becomes incredibly powerful.

---

# The Unix Pipeline

This single symbol

```
|
```

changed computing.

```
Command A

↓

Command B

↓

Command C

↓

Result
```

Example

```
cat users.csv

↓

grep Engineering

↓

cut -d, -f2

↓

sort

↓

uniq
```

Every command solves ONE problem.

Together...

they solve almost anything.

---

# grep

grep means

```
Global

Regular Expression

Print
```

But honestly...

remember this instead.

> grep finds text.

---

Example

```
grep ERROR logs.txt
```

Find every line containing

```
ERROR
```

---

Case insensitive

```
grep -i hello
```

Invert

```
grep -v hello
```

Count

```
grep -c hello
```

Line numbers

```
grep -n hello
```

Recursive

```
grep -r hello .
```

Extended regex

```
grep -E
```

---

# grep Thinks in Lines

This realization changed everything.

grep never finds words.

grep never finds characters.

grep finds

```
Lines.
```

Every decision happens one line at a time.

Remember this forever.

---

# Regular Expressions

Regex is NOT programming.

Regex is

```
Pattern matching.
```

Nothing more.

---

Want digits?

Describe digits.

Want emails?

Describe emails.

Want IPs?

Describe IPs.

Regex never understands meaning.

Only patterns.

---

# Anchors

Beginning

```
^
```

End

```
$
```

---

# Wildcards

Any character

```
.
```

Zero or more

```
*
```

One or more

```
+
```

Optional

```
?
```

---

# Character Classes

Digits

```
[0-9]
```

Lowercase

```
[a-z]
```

Uppercase

```
[A-Z]
```

Either

```
[A-Za-z]
```

---

POSIX Classes

```
[[:digit:]]

[[:alpha:]]

[[:space:]]

[[:lower:]]

[[:upper:]]
```

---

# Quantifiers

Exactly 3

```
{3}
```

1 to 5

```
{1,5}
```

At least 2

```
{2,}
```

---

# Escaping

Sometimes

```
.
```

means

ANY CHARACTER.

Sometimes you want

an actual dot.

Escape it.

```
\.
```

Same for

```
\*

\+

\?

\[
```

---

# Patterns We Built

Integer

```
^[0-9]+$
```

Everything ending in txt

```
.*\.txt$
```

Email

```
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}
```

Roll number

```
[0-9]{4}[a-f0-9]{6}
```

---

# cut

cut extracts columns.

CSV

```
Name,Age,City
```

Delimiter

```
,
```

First field

```
cut -d, -f1
```

Second field

```
cut -d, -f2
```

Simple.

Powerful.

---

# CSV Processing Pattern

This became our favourite.

```
tail

↓

while read

↓

cut

↓

Regex

↓

Output
```

You'll see this pattern everywhere.

---

# Common Mistakes

Thinking grep returns words.

Thinking regex is programming.

Forgetting

```
\.
```

Thinking

```
*
```

means "multiply."

Forgetting

```
^
```

and

```
$
```

---

# Linux Philosophy

grep doesn't care WHY.

It only cares

DOES THIS MATCH?

Unix tools stay intentionally stupid.

That makes them incredibly flexible.

---

# Battle Story

At one point,

regex looked like absolute nonsense.

Twenty minutes later,

I was writing my own email patterns.

The syntax didn't become easier.

My eyes became better.

That is how regex works.

One day...

you simply start seeing patterns.
