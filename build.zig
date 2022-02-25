const std = @import("std");

pub fn build(builder: *std.build.Builder) !void {
    const exe = builder.addExecutable("nano", null);

    try exe.linkSystemLibraryPkgConfigOnly("ncurses");

    exe.defineCMacro("NANO_REG_EXTENDED", "REG_EXTENDED");

    exe.addCSourceFiles(&.{
        "src/browser.c",
        "src/chars.c",
        "src/color.c",
        "src/cut.c",
        "src/files.c",
        "src/global.c",
        "src/help.c",
        "src/history.c",
        "src/move.c",
        "src/nano.c",
        "src/prompt.c",
        "src/rcfile.c",
        "src/search.c",
        "src/text.c",
        "src/utils.c",
        "src/winio.c",
    }, &.{});

    exe.install();

    builder.default_step.dependOn(&exe.step);
}
