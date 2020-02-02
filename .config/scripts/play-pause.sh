#!/bin/bash

play=$(mpc status | grep playing )
pause=$(mpc status | grep paused )

if [ -n "$play" ]; then
    echo -e '\uf04b'
elif [ -n "$pause" ]; then
    echo -e '\uf04c'
else
    echo 0
fi