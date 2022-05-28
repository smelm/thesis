
# The Pipeline

## Input 

### "Internal" DSL

```
DSL([
    many(any),
    anyOf(LETTER)
])
```

### "External" DSL

```
many of any
any of set(LETTER)
```

## Compiled into AST Representation

```
{
    type: "sequence",
    value: [{
        type: "many",
        value: {
            type: "any"
        }
    }, 
    {
        type: "set",
        value: [{ type: "set", value: "LETTER" }]
    }
    ]
}
```
