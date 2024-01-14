Pointers
----
Zig has two kinds of pointers: single-item and many-item.
* `*T` - single-item pointer to unknown number of items.
    * Supports deref syntax: `ptr.*`
* `[*]T` - many-item pointer to unkonwn number of items.
    * Supports index syntax: `ptr[i]`
    * Supports slice syntax: `ptr[start..end]`
    * Supports pointer arithmetic: `ptr + x`, `ptr -x`
    * `T` must have a known size, which means that it cannot be `nayopaque` or any other `opaque type`.

These types are closely related to `Arrays` and `Slices`:
* `*[N]T` - pointer to N items, same as single-item pointer to an array.
    * index syntax: `array_ptr[i]`
    * slice syntax: `array_ptr[start..end]`
    * len properly: `array_ptr.len`
* `[]T` - pointer to runtime-known number of items.
    * index syntax: `slice[i]`
    * slice syntax: `slice[start..end]`
    * len property: `slice.len`


Sentinel-Terminated Pointers
----
The syntax `[*:x]T` describes a pointer that has a length determined by a sentinel value. This provides protection against buffer overflow and overreads.
