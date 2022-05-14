# Design Principles
- non-programmers have no concept of
    - greedy vs not greedy
    - that newline is a character
    - what special characters are
    - greedy vs not greedy
- abbreviations should never be used (`newline` instead of `nl` or `\n`)
- the biggest problem of regex this DSL tackles is the tersity
- when in doubt, the design should lean towards verbosity

# Concatenation

- either implicit

```
hello
world
```

- or explicit
```
hello
then world
```
- implicit is definetely better

# Literal Characters
- can user enter an entire line that is matched verbatim

```
many of a
hello world
```
- or do they need to escape it in some way?
- could be done with `literally` 
- kind of cute but also annyoing
- upside is that it is very explicit and leaves no question wether the language does some magic in that specif line
- keywords need to be escaped anyway

```
many of a
literally hello world
```

# Dot (.)
```
anything
any character
any
```

## Matching newline or not
- corresponds to the `DOTALL` flat in python
- should newline realy be treated as a character
- words like *newline* should under no circumstances be abbreviated to *nl*

```
anything including newline
```

# Carret (^) and Dollar Sign ($)
```
starts with
line starts with (in multiline mode)
```

# Repetition Qualifiers


## One or many (+)
```
at least one a
many a
many as
some a
some as
```

## Optional (?)
```
optionally ...
```

## Zero or many (.)
- should it even exists?
- probably better handled as combination of `+` and `?`, not the non-greedy version but an optional one or many

```
optionally some a
maybe ...
may ...
```

## n times ({n}) or ({n, m})
```
5 as
5 times a
5 to 7 as
5 to 7 times a
```

## Greedy vs non-greedy
- not a single clue
- how could non-programmars express something like that

# Sets of characters

[abc]
```
a, b or c
any of a, b or c
either a, b or c
```

[a-kD-G5]
```
anything from a to k, from D to G or 5
either a to k, D to G or 5
```
- either or is probably better used for `|`

## Character Classes
[\w]
```
any letter
```

## Complement
[^5]
```
anything but 5
```

- how would "any letter but a" look as regex

## Nested Sets
- not supported in python yet

# Groups
- should unnamed groups be supported?

(a[abc]x{4})
```
group:
    a
    any of a, b, c
    4 times x

capture:
    ...

collect:
    ...

start group
    ...
end group

```

