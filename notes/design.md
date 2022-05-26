# Design Principles
- non-programmers have no concept of
    - greedy vs not greedy
    - that newline is a character
    - what special characters are
    - greedy vs not greedy
- abbreviations should never be used (`newline` instead of `nl` or `\n`)
- the biggest problem of regex this DSL tackles is the terseness
- when in doubt, the design should lean towards verbosity
- should some things not have defaults but be explicit every time (especially greedy and non-greedy)?not have defaults but be explicit every time (especially greedy and non-greedy)?

# Notes on Current Draft

## Special Characters and keywords
- ","
- numbers
- whitespace
- at
- or
- to
- any
- start or beginning
- many
- maybe
- but
- either
- or

## Open Questions
- how should literals be handled?
    - with quotes
    - with keyword
- does concatenation need a new line or should it also work inline?
- should greedy vs non-greedy always be explicit or should the DSL have a default like regex does?


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
- implicit is definitely better

# Literal Characters
- can user enter an entire line that is matched verbatim

```
many of a
hello world
```
- or do they need to escape it in some way?
- could be done with `literally` 
- kind of cute but also annoying
- upside is that it is very explicit and leaves no question whether the language does some magic in that specific line
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
- any looks bad on its own but best when in combination with other constructs
- this would minimize keyword count, since the `any` keyword is most likely to be used in other constructs as well

## Matching newline or not
- corresponds to the `DOTALL` flat in python
- should newline really be treated as a character
- words like *newline* should under no circumstances be abbreviated to *nl*

```
anything including newline
any including newline
anything including a new line
any including a new line
any or a new line
any or new line
```

# Caret (^) and Dollar Sign ($)
- should default two multiline mode and compile to the special characters that only match bol/eol if necessary
```
starts with
line starts with (in multiline mode)
at beginning (of line)
at start (of line)
at end (of line)
```

# Repetition Qualifiers

## One or many (+)
```
at least one of a
many of a
many as
some of a
some as
repeated
no less than 1 a
any amount of 
numerous
```

### Non-greedy (+?)
- we can use the otherwise undesirable connotation of *many* with a lot to differentiate greedy with non-greedy behavior

| `a+`      | `a+?`    |
|-----------|----------|
| many of a | few of a |

- other non-greedy repetition qualifiers don't have the same easy solution

## Optional (?)
```
optionally ...
maybe
may
possibly
```

### Non-greedy (??)
- what does the `maybe` keyword express? `?` or `??`

## Zero or many (`*`)
- should it even exists?
- probably better handled as combination of `+` and `?`, not the non-greedy version but an optional one or many

```
optionally some a
maybe ...
may ...
```

## n times (`a{5}` or `a{5, 7}`)
```
5 as
5 times a
5 to 7 as
5 to 7 times a
5 of a
5 to 7 of a
```

### Non-greedy (`a{5}?` or `a{5, 7}`)
- which is better expressed by `2 to 5`?
- what do non-programmers expect?
- non of these suggestions are really that good

```
// to describe non-greedy
2 to 5 fewest of a
2 to 5 and fewest of a
fewest of 2 to 5 of a
few of 2 to 5 of a

// to describe greedy
many of 2 to 5 of a
most of 2 to 5 of a
```


# Sets of characters

## `[abc]`
```
a, b or c
any of a, b, c
any of a, b or c
either a, b or c
```

### `[abc]{5}`
```
5 of any of a, b, c

// how to implement, does not work well with other modifiers?
any 5 of a, b, c 

// very clean but ambigous with 5 of "a,b,c"
5 of a,b,c
```

### `[abc]+`
```
// sounds like dr seuss
many of any of a, b, c

// not as ambigous as the {5} case
many of a, b, c 
```

## `[a-kD-G5]`

- either or is probably better used for `|`

```
anything from a to k, from D to G or 5
either a to k, D to G or 5
any of a to k, D to G, 5
any of a to k or D to G or 5
```

## Character Classes

### `[\w]`
```
any letter
```

## Complement (`^`)
### `[^abc]`
```
anything but a,b,c
any but a,b,c
any except a,b,c
```

- how would "any letter but a" look as regex

## Nested Sets
- not supported in python yet

# Or (`|`)
- important note: operator short circuits, when a matches b is not checked
- should the DSL behave that way

## `a | b`
```
either a or b
a or b
one of a,b
```

## `a | b | c`
```
either a or b or c
a or b or c
one of a,b,c
```

# Groups
- should unnamed groups be supported?
- it would be best to avoid whitespace sensitive concepts (aka python-style syntax)
- the explicit versions are better than just using group name and indentation

```
group_name:
    ...

group|capture|collect|extract|remember|store|save as group_name:
    ...

begin group_name

end
```

# Flags

- could be either set with a `set` keyword or with a command of their own

```
set ascii-only
ascii only
```

