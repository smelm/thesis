
| ExRegEx                  |           RegEx |
|--------------------------|----------------:|
| - not needed -           |               \ |
| any                      |               . |
| many of <exp>            |          <exp>+ |
| maybe many of <exp>      |          <exp>* |
| maybe <exp>              |          <exp>? |
| few of <exp>             |         <exp>+? |
| maybe few of <exp>       |         <exp>*? |
|                          |         <exp>?? |
| m of <exp>               |        <exp>{m} |
| m to n of <exp>          |      <exp>{m,n} |
| starts with <exp>        |          ^<exp> |
| line starts with <exp>   |      ^<exp>[^2] |
|                          |              \A |
| ends with <exp>          |          <exp>$ |
| line ends with <exp>     |      <exp>$[^2] |
|                          |              \Z |
| any of <exps>            |        [<exps>] |
| any of <char> to <char>  | [<char>-<char>] |
| any but <exp>            |        [^<exp>] |
| <exp> or <exp>           |  <exp> \| <exp> |
| - not supported -        |         (<exp>) |
| - not supported -        |       \<number> |
| - only used internally - |  (?\:<exp>)[^3] |
|                          | (?P=<name>)[^4] |

# Flags 

| ExRegEx |                RegEx |
|---------|---------------------:|
|         |        (?a)<exp>[^5] |
|         |        (?i)<exp>[^6] |
|         |        (?L)<exp>[^7] |
|         |        (?m)<exp>[^8] |
|         |        (?s)<exp>[^9] |
|         |       (?u)<exp>[^10] |
|         |       (?x)<exp>[^11] |
|         | (?<flag>:<exp>)[^12] |

# Conditionals

| ExRegEx |                      RegEx |
|---------|---------------------------:|
|         |                 (?=<expr>) |
|         |                 (?!<expr>) |
|         |                (?<=<expr>) |
|         |                (?<!<expr>) |
|         | (?(group)<expr> \| <expr>) |

# Character Classes

| ExRegEx |                                          RegEx |
|---------|-----------------------------------------------:|
|         |                                            \\b |
|         |                                            \\B |
|         |                                            \\d |
|         |                                            \\D |
|         |                                            \\s |
|         |                                            \\S |
|         |                                            \\w |
|         |                                            \\W |
|         | \\a \\b \\f \\n \\N \\r \\t \\u \\U \\v \\x \\ |
|         |                               \\N \\u \\U[^13] |

# DSL specific

| ExRegEx                         |      RegEx |
|---------------------------------|-----------:|
| begin within " <expr> end       |   "<expr>" |
| begin within ( and ) <expr> end | \(<expr>\) |

[^1]: no escaping needed?
[^2]: in multiline mode
[^3]: non capturing group
[^4]: back reference to named group
[^5]: ASCII-only, only applies to character classes
[^6]: ignore case
[^7]: locale dependent
[^8]: multi-line
[^9]: dot matches all
[^10]: Unicode matching
[^11]: verbose
[^12]: flag only applies within group
[^13]: only recognized in Unicode
