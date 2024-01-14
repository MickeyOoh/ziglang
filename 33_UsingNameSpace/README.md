usingnamespace
----
`usingnamespace` is a declaration that mixes all the public declarations of the operand, which must be a `struct, union, enum, or opaque`, into the namespace:

[usingnamespace.zig](./usingnamespace.zig)

`usingnamespace` has an important use case when organizing the public API of a file or package.
For example, one might have `c.zig` with all of the `C imports`:

[c.zig](./c.zig)

