SOURCES := $(shell find src -name '*.fnl')
OBJECTS := $(patsubst src/%.fnl, build/%.lua, $(SOURCES))

.PHONY: all clean

all: $(OBJECTS) init.lua 

clean:
	cp build/theme.lua dynamic/theme.lua
	rm -rf build

build/%.lua: src/%.fnl
	mkdir -p $(dir $@)
	fennel --compile $< > $@

init.lua: build/init.lua
	cp $< $@
	rm build/init.lua
	[ -f build/theme.lua ] || cp dynamic/theme.lua build/theme.lua
