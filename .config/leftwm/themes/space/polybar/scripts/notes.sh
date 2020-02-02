#!/bin/bash
Dir="$HOME/Docs/Notes"  

file=$(fd --search-path $Dir -e md -x echo {/.} | rofi -theme ~/.config/leftwm/themes/current/rofi -dmenu -p "Notes")
kitty /bin/sh -c "nvim -c Goyo -c Limelight -c 'startinsert' -- $Dir/$file.md"