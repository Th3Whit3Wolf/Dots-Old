#!/usr/bin/env bash

BAR_ICON=""
NOTIFY_ICON=/usr/share/icons/Papirus/32x32/apps/system-software-update.svg

get_total_updates() { UPDATES=$(checkupdates 2>/dev/null | wc -l); }
get_rustup_updates() { RUSTUP=$(rustup check | grep -v "Up to date" | wc -l); }
while true; do
    get_total_updates
		get_rustup_updates

    # notify user of updates
    if hash notify-send &>/dev/null; then
        if (( UPDATES > 50 )); then
            notify-send -u critical -i $NOTIFY_ICON \
                "You really need to update!!" "$UPDATES New packages"
        elif (( UPDATES > 25 )); then
            notify-send -u normal -i $NOTIFY_ICON \
                "You should update soon" "$UPDATES New packages"
        elif (( UPDATES > 2 )); then
            notify-send -u low -i $NOTIFY_ICON \
                "$UPDATES New packages"
        fi
    fi

    # when there are updates available
    # every 10 seconds another check for updates is done
    while (( UPDATES > 0 )); do
        if (( UPDATES == 1 )); then
					if (( RUSTUP > 0));then
						echo " $UPDATES Update  $RUSTUP"
					else 
						echo " $UPDATES Update"
					fi
        elif (( UPDATES > 1 )); then
          if (( RUSTUP > 0));then
						echo " $UPDATES Updates  $RUSTUP"
					else 
						echo " $UPDATES Updates"
					fi
        else
           if (( RUSTUP > 0));then
						echo " $RUSTUP"
					else 
						echo "$BAR_ICON"
					fi
 
        fi
        sleep 10
        get_total_updates
    done

    # when no updates are available, use a longer loop, this saves on CPU
    # and network uptime, only checking once every 30 min for new updates
    while (( UPDATES == 0 )); do
        echo "$BAR_ICON"
        sleep 1800
        get_total_updates
				get_rustup_updates
    done
done
