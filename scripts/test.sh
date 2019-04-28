#!/bin/bash

function get_updates {
    update=$(echo $(xbps-install -Mun | awk '{print $1}'))
    count=$(echo $update | wc -l)
    exit_status=$?

    if [ $exit_status -eq 0 ]; then
        if ((count = 1)); then
            notify-send '1 Update Available' "$update"
            sleep 1h
            get_updates
        elif ((count > 1)); then
            notify-send '$count Updates Available' "$update"
            sleep 1h
            get_updates
        else
            sleep 1h
            get_updates
        fi
    else
        sleep 1h
        get_updates
    fi
}

get_updates