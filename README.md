Source: [zlglang documentation](https://github.com/ziglang/www.ziglang.org)


version 0.9.1 done

1/11/2024 doing ver 0.11.0

# ziglang.org

Website for [Zig](https://github.com/ziglang/zig)

## How to run locally

### Requirements

- A build of [kristoff-it/hugo](https://github.com/kristoff-it/hugo)
- A build of [kristoff-it/zig-doctest](https://github.com/kristoff-it/zig-doctest)
- Latest Zig (the website tracks master branch)

Hugo needs to be built with CSS support:

```
CGO_ENABLED=1 go build --tags extended
```

Finally, Hugo expects to find both `zig` and `doctest` in `$PATH`.


