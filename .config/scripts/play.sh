#!/bin/bash

Dir="$HOME/Vids"                                # Source Directory
FTf=".*\.\(mp4\|mkv\|mp3\|webm\|m4v\|avi\)"     # File Types (find)
FTF="mp4$|mkv$|mp3$|webm$|m4v$|avi$"            # File Types (fd)
# Color
fg="fg:#a3a3a3"                                     # Text
fgp="fg+:#a3a3a3"                                   # Text (Current Line)
bg="bg:#292b2e"                                     # Background
bgp="bg+:#292b2e"                                   # Background (Current Line)
hl="hl:#2d9574"                                     # Highlighted Substring
hlp="hl+:#2d9574"                                   # Highlighted Substring (Current Line)
info="info:#a31db1"                                 # Info
border="border:0"                                   # Border of preview window --border
prompt="prompt:#181823"                             # Prompt
ptr="pointer:#181823"                               # Pointer to the current line
marker="marker:#29422d"                             # Multi Line Select Marker
spinner="spinner:#5d4d7a"                           # Streaming Input Indicator
hdr="header:#5d4d7a"                                # Header

title="What would you like to play?"
layout="--layout=reverse"

if [[ -x /usr/bin/fd ]]; then
    if [[ -x /usr/bin/sk ]]; then
        File=$(fd --search-path $Dir -j4 -t f $FTF | cut -d '/' -f5-  | sk --header="$title" $layout --color=$fg,$fgp,$bg,$bgp,$hl,$hlp,$info,$prompt,$ptr,$marker,$spinner,$hdr)
        exit_status=$?
    elif [[ -x /usr/bin/fzf ]]; then
        File=$(fd --search-path $Dir -j4 -t f -- $FTF | cut -d '/' -f5- | fzf --header="$title" $layout --color=$fg,$fgp,$bg,$bgp,$hl,$hlp,$info,$prompt,$ptr,$marker,$spinner,$hdr)
        exit_status=$?
    elif [[ -x /usr/bin/fzf ]]; then
        File=$(fd --search-path $Dir -j4 -t f -- $FTF | cut -d '/' -f5-  | fzy)
        exit_status=$?
    else
        echo 'This Script requires skim, fzf, or fzy to be installed'
        return 1
    fi
else
    if [[ -x /usr/bin/sk ]]; then
        File=$(find $Dir -type f -regex $FTf | sk --header="$title" $layout --color=$fg,$fgp,$bg,$bgp,$hl,$hlp,$info,$prompt,$ptr,$marker,$spinner,$hdr)
        exit_status=$?
    elif [[ -x /usr/bin/fzf ]]; then
        File=$(find $Dir -type f -regex $FTf | fzf --header="$title" $layout --color=$fg,$fgp,$bg,$bgp,$hl,$hlp,$info,$prompt,$ptr,$marker,$spinner,$hdr)
        exit_status=$?
    elif [[ -x /usr/bin/fzf ]]; then
        File=$(find $Dir -type f -regex $FTf | fzy)
        exit_status=$?
    else
        echo 'This Script requires skim, fzf, or fzy to be installed'
        return 1
    fi
fi

if [ $exit_status -eq 0 ]; then
    mpv --gpu-context=wayland --hwdec=auto --fs --profile=gpu-hq "$HOME/Vids/$File"
else
    :
fi