#!/bin/bash

swaynag $TYPE -m 'What would you like to do?' \
    --message-padding 10 -B 'Lock' 'swaylock' \
    -B 'Logout' 'swaymsg exit' \
    -B 'Reboot' 'loginctl reboot' \
    -B 'Shutdown' 'loginctl poweroff' \
    --dismiss-button Nevermind \
    --background 292b2e \
    --border 5d4d7a \
    --border-bottom 5d4d7a \
    --button-background 24292e \
    --text a3a3a3 \
    --button-margin-right 45 \
    --button-padding 4 \
    --button-border-size 2 \
    --button-gap 45
