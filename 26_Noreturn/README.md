Noreturn
-------
noreturn is the type of:

* break
* continue
* return
* unreachable
* while (true) {}

When resolving types together, such as `if` clauses or `switch` prongs, the `noreturn` type is compatible with every other type. 
