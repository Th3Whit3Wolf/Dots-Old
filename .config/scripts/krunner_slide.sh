#!/bin/bash
# get the window_id for the current active window
win_id="$(xdotool search --onlyvisible --class 'krunner')"

# Get the x and y coords for the current window, top left-hand corner.
x=$(xwininfo -id $win_id | awk '/Abs.+X/ { sub(/^.+\s/,""); print }')
y=$(xwininfo -id $win_id | awk '/Abs.+Y/ { sub(/^.+\s/,""); print }')

# Shift the coords by 30 pixels, down and across.
(( x+=0 , y+=35 ))

# Move the current window to the new coords, $x $y.
xdotool getwindowfocus windowmove  $x $y
