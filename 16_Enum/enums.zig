const expect = @import("std").testing.expect;
const mem = @import("std").mem;
const print = @import("std").debug.print;

// Declare an enum.
const Type = enum {
    ok,
    not_ok,
};

// Declare a specific instance of the enum variant.
const c = Type.ok;

// If you want access to the ordinal value of an enum, you
// can specify the tag type.
const Value = enum(u2) {
    zero,
    one,
    two,
};

// Now you can cast between u2 and Value.
// The ordinal value starts from 0, counting up for each member.
test "enum ordinal value" {
    print("\n",.{});
    try expect(@enumToInt(Value.zero) == 0);
    try expect(@enumToInt(Value.one) == 1);
    try expect(@enumToInt(Value.two) == 2);
    print("@enumToInt(Value.zero):{}\n", .{@enumToInt(Value.zero)});
    print("@enumToInt(Value.one):{}\n", .{@enumToInt(Value.one)});
    print("@enumToInt(Value.two):{}\n", .{@enumToInt(Value.two)});
}

// You can override the ordinal value for an enum.
const Value2 = enum(u32) {
    hundred = 100,
    thousand = 1000,
    million = 1000000,
};
test "set enum ordinal value" {
    print("\n", .{});
    try expect(@enumToInt(Value2.hundred) == 100);
    try expect(@enumToInt(Value2.thousand) == 1000);
    try expect(@enumToInt(Value2.million) == 1000000);
    print("@enumToInt(Value2.hundred):{}\n", .{@enumToInt(Value2.hundred)});
    print("@enumToInt(Value2.thousand):{}\n", .{@enumToInt(Value2.thousand)});
    print("@enumToInt(Value2.million):{}\n", .{@enumToInt(Value2.million)});
}

// Enums can have methods, the same as structs and unions.
// Enum methods are not special, they are only namespaced
// functions that you can call with dot syntax.
const Suit = enum {
    clubs,
    spades,
    diamonds,
    hearts,

    pub fn isClubs(self: Suit) bool {
        print("self:{}\n", .{self});
        return self == Suit.clubs;
    }
};
test "enum method" {
    print("\n",.{});
    const p = Suit.spades;
    try expect(!p.isClubs());
    print("p:{}\n", .{p});
    print("p.isClubs():{}\n", .{p.isClubs()});
}

// An enum variant of different types can be switched upon.
const Foo = enum {
    string,
    number,
    none,
};
test "enum variant switch" {
    print("\n", .{});
    const p = Foo.number;
    const what_is_it = switch (p) {
        Foo.string => "this is a string",
        Foo.number => "this is a number",
        Foo.none => "this is a none",
    };
    try expect(mem.eql(u8, what_is_it, "this is a number"));
    print("p:{}\n", .{p});
    print("what_is_it:{s}\n", .{what_is_it});
}

// @typeInfo can be used to access the integer tag type of an enum.
const Small = enum {
    one,
    two,
    three,
    four,
};
test "std.meta.Tag" {
    try expect(@typeInfo(Small).Enum.tag_type == u2);
    print("\n@typeInfo(Small).Enum.tag_type:{}\n", .{@typeInfo(Small).Enum.tag_type});
}

// @typeInfo tells us the field count and the fields names:
test "@typeInfo" {
    try expect(@typeInfo(Small).Enum.fields.len == 4);
    try expect(mem.eql(u8, @typeInfo(Small).Enum.fields[1].name, "two"));
    print("\n@typeInfo(Small).Enum.fields.len:{}\n",
                        .{@typeInfo(Small).Enum.fields.len});
    //const string = @typeInfo(Small).Enum.fields[1].name;
    print("@typeInfo(Small).Enum.fields[1].name:{s}\n",.{@typeInfo(Small).Enum.fields[1].name});

}

// @tagName gives a [:0]const u8 representation of an enum value:
test "@tagName" {
    try expect(mem.eql(u8, @tagName(Small.three), "three"));
    print("\n@tagName(Small.three):{s}\n", .{@tagName(Small.three)});
}