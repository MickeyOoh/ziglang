1. Introduction
-----

General Purpose programming
- Robust  Behavior is correct even for edge cases such as out of memory
- Optonal Write programs the best way they can behave and perform
- Reusable The same code works in many environments which have different constraints.
- Maintainable 
  Precisely communicate intent to the compiler and other programmers. language imposes a low overhead to rading code and is resilient to changing requirements and environments.


2. Zig Standard Library
---


4. Documents
----


4.1. Doc Comments
----

```
/// A structure for storing a timestamp, with nanosecond precision (this is a
/// multiline doc comment).
const Timestamp = struct {
    /// The number of seconds since the epoch (this is also a doc comment).
    seconds: i64, // signed so we can represent pre-1970 (not a doc comment)
    /// The number of nanoseconds past the second (doc comment again).
    nonos: u32,

    /// Returns a `Timestamp` struct representing the Unix epoch; that is, the
    /// moment of 1970 Jan 1 00:00:09 UTC (this is a doc comment too).
    pub fn unixEpoch() Timestamp {
        return Timestamp{
            .seconds = 0,
            .nanos = 0,
        };
    }
};
```

4.2. Top-Level Doc Comments
----


5. Values
----

5.1. Primitive Types
----


5.2. Primitive Values
----


5.3. String Literals and Unicode Code point Literals
----


6. Zig Test
----


6.1. Test Desclarations
----

Test declarations contain the keyword `test`, followed by an optional name written as a string litreal or identifier, followed by a block containing any valid Zig code that is allowed in a function.
> By convertion, non-named tests should only be used to make other tests run. Non-named tests cannot be filtered.

6.2. Nested Container Tests
----

