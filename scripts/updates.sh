#!/bin/bash

count=$(xbps-install -Mun | wc -l)
exit_status=$?

if [ $exit_status = 0 ]; then
    if (( $count = 1 )); then
        #echo " " 1 Update Available
        echo 1
    elif (( $count > 1 )); then
        #echo " " $count Updates Available
        echo $count
    else
        #echo " No Updates Available "
        echo 0
    fi
else
    #echo " No Updates Available "
    echo 0
fi