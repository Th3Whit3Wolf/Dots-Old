#!/bin/bash

Dir="$HOME/Vids"                                # Source Directory
FTF="mp4$|mkv$|mp3$|webm$|m4v$|avi$"            # File Types (fd)

file=$(fd --search-path $Dir -j4 -t f $FTF  | rofi -theme ~/.config/leftwm/themes/current/rofi -dmenu -p "What would you like to watch?")

mpv -fs "$file"