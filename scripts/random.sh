#!/bin/bash

status=$(mpc status | grep repeat | awk '{print $6}')

if [[ "$status" == "on" ]]; then
    echo -e '\uf074'
elif [[ "$status" == "off" ]]; then
    echo -e '\uf99d'
else
    echo ""
fi