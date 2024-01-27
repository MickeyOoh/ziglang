1/2 or Test [1/2] difference

```
$~/tool/zigtest test_switch.zig
zig testing test_switch.zig
zig test test_switch.zig 2>&1 | head
1/2 test.switch simple... OK
2/2 test.switch inside function... OK
```

```
$ zig test test_switch.zig
Test [1/2] test.switch simple...
```


