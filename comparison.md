
| ExRegEx                 |           RegEx |
|-------------------------|----------------:|
| -[^1]                   |               \ |
| any                     |               . |
| many of <exp>           |          <exp>+ |
|                         |          <exp>* |
|                         |          <exp>? |
| many of <exp>           |         <exp>+? |
|                         |         <exp>*? |
|                         |         <exp>?? |
|                         |        <exp>{m} |
|                         |      <exp>{m,n} |
| starts with <exp>       |          ^<exp> |
| line starts with <exp>  |      ^<exp>[^2] |
| ends with <exp>         |          <exp>$ |
| line ends with <exp>    |      <exp>$[^2] |
| any of <exps>           |        [<exps>] |
| any of <char> to <char> | [<char>-<char>] |
| any but <exp>           |        [^<exp>] |
| <exp> or <exp>          |  <exp> \| <exp> |
|                         |         (<exp>) |
|                         |  (?\:<exp>)[^3] |
|                         |   (?a<exp>)[^4] |
|                         |   (?i<exp>)[^5] |
|                         |   (?L<exp>)[^6] |
|                         |   (?m<exp>)[^7] |
|                         |   (?s<exp>)[^8] |
|                         |   (?u<exp>)[^9] |
|                         |  (?x<exp>)[^10] |
|-------------------------|-----------------|
| Character Classes       |                 |
|-------------------------|-----------------|
|                         |                 |
|                         |                 |
|                         |                 |
|                         |                 |

[^1]: no escaping needed
[^2]: in multiline mode
[^3]: non capturing group
[^4]: ASCII-only
[^5]: ignore case
[^6]: locale dependent
[^7]: multi-line
[^8]: dot matches all
[^9]: Unicode matching
[^10]: verbose
