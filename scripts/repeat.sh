#!/bin/bash

status=$(mpc status | grep repeat | awk '{print $4}')

if [[ "$status" == "on" ]]; then
    echo -e '\uf955'
elif [[ "$status" == "off" ]]; then
    echo -e '\uf956'
else
    echo ""
fi