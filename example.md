`(?:(?:\+?1\s*(?:[.-]\s*)?)?(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*)\s*(?:[.-]\s*)?)([0-9]{4})`

```
begin
    maybe
        maybe +
        1
        maybe many of WHITE_SPACE
        maybe 
            any of ., -
            maybe many of WHITE_SPACE
        end
    end
    begin
        maybe many of WHITE_SPACE
        either
            any of 2 to 9
            1
            any of 0, 2 to 9
        or
            any of 2 to 9
            any of 0, 2 to 8
            1
        or
            any of 2-9
            any of 0, 2 to 8
            any of 0, 2 to 9
        maybe many of WHITE_SPACE
    end
    maybe many of WHITE_SPACE
    begin
        any of ., -
        maybe many of WHITE_SPACE
    end
end
begin 
    4 times of any of 0 to 9
end
```

note: the unnamed groups `begin ... end` will probably not be supported in the final DSL. They are just included to match the input more closely
