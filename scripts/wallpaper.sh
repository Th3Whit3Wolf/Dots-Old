#!/bin/bash

Dir="$HOME/Pics"
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

if [[ -x /usr/bin/sk ]]; then
    image=$(fd --search-path $Dir | sk --header="$title" $layout --color=$fg,$fgp,$bg,$bgp,$hl,$hlp,$info,$prompt,$ptr,$marker,$spinner,$hdr --preview-window 'right:70%' --preview 'imv {}')
    exit_status=$?
elif [[ -x /usr/bin/fzf ]]; then
    image=$(fd --search-path $Dir | fzf --header="$title" $layout --color=$fg,$fgp,$bg,$bgp,$hl,$hlp,$info,$prompt,$ptr,$marker,$spinner,$hdr --preview-window 'right:70%' --preview 'imv {}')
    exit_status=$?
else
    echo 'This Script requires skim, fzf, or fzy to be installed'
    return 1
fi


if [ $exit_status -eq 0 ]; then
    echo 'set $wallpaper' $image > ~/.config/sway/config.d/bg.conf
    sway reload
else
    :
fi