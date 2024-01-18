#!/bin/zsh
echo "zig build-obj float_mode_obj.zig"
zig build-obj float_mode_obj.zig

echo "zig run float_mode_exe.zig float_mode_obj.o"
zig run float_mode_exe.zig float_mode_obj.o

if [ -e float_mode_obj.o ]; then
	rm *.o
fi


