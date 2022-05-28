
# Verification and Coverage

- compile sample DSL code for each target
    - how many snippets are needed to cover DSL?
    - coverage?
- go through the DSL and create test strings
- they should behave the same in all target languages

## Generation of Test Strings
- use "generator combinators"
- `Generator :: (Maybe RandomSeed) -> N -> String[N]`


