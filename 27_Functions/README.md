[Functions](https://ziglang.org/documentation/master/#toc-Functions)
----


[Pass-by-value Parameters](https://ziglang.org/documentation/master/#toc-Pass-by-value-Parameters)
----
Primitive types such as `Integers` and `Floats` passed as parameters are copied, and then the copy is available in the function body. This is called "passing by value". Copying a primitive type is essentially free and typically involves nothing more than setting a register.

Structs, unions, and arrays can sometimes be more efficiently passed as a reference, since a copy could be arbitrarily expensive depending on the size.
When these types are passed as parameters, Zig may choose to copy and pass by value, or pass by reference, whichever way Zig decides will be faster. This is made possible, in part, by the fact that parameters are immutable.

[Function Parameter Type Inference](https://ziglang.org/documentation/master/#toc-Function-Parameter-Type-Inference)
-----
Function parameters can be declared with `anytype` in place of the type. In this case the parameter types will be inferred when the fucntion is called.
Use `@TypeOf` and `@typeinfo` to get information about the inferred type.
