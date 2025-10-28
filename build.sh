#!/bin/bash

if [ ! -d build ]; then
    echo "<loader.sh>--> Creating build/ directory ..."
    mkdir build
    echo "<loader.sh>--> build/ directory created."
fi

echo "<loader.sh>--> Making build ..."
make
echo "<loader.sh>--> Build complete."

if [ -f build/theme.lua ]; then
    echo "build/theme.lua exists! doing nothing ..."
else
    echo "<loader.sh>--> Creating build/theme.lua ..."
    echo "-- Themery block" > build/theme.lua
    echo "-- This block will be replaced by Themery." >> build/theme.lua
    echo "vim.cmd(\"colorscheme onedark\")" >> build/theme.lua
    echo "vim.g.theme_id = 6" >> build/theme.lua
    echo "-- end themery block" >> build/theme.lua
    echo "<loader.sh>--> build/theme.lua created."
fi

echo "<loader.sh>--> nvim dots installed."
