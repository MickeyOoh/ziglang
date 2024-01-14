Struct
-----


exern struct
----
An `extern struct` has in-memory layout guaranteed to match the C ABI for the target.
This kind of struct should only be used for compatiblilty with the C ABI. Every other use case should be solved with `packed struct` or normal `struct`.

packed struct
-----
`packed` structs have guaranteed in-memory layout:
* Field remain in the order declared.
* There is no padding between fields.
* Zig supports arbitrary width `integers` and although normally, integers with fewer than 8 bits will still use 1 byte of memory, in packed structs, they use exactly their bit width.
* `bool` fields use exactly 1 bit.
* An `enum` field uses exactly the bit width of its integer tag type.
* A `packed union` field uses exactly the bit width of the union field with the largest bit width.
* Non-ABI-aligned fields are packed into the smallest possible ABI-aligned integers in accordance with the target endianness.

struct Naming
-----
Since all structs are anonymous, Zig infers the type name based on a few rules.
* If the struct is in the initialization expression of a variable, it gets named after that variable.
* 