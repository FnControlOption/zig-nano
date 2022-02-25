nano: $(wildcard src/*)
	echo "#define REVISION \"`git describe --tags 2>/dev/null`\"" > src/revision.h
	zig build
	cp zig-out/bin/nano nano

clean:
	rm -f nano
	rm -rf zig-cache zig-out
