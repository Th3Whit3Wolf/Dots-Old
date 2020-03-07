#!/bin/bash

HERE="$HOME/.config/bspwm"

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

function latte {
  if pgrep -x latte-dock > /dev/null 
  then
    sleep 5
    run polybar -c $HERE/polybar/plasma_bspwm.ini mainbar
  else
    sleep 1 
    latte
  fi
}


if [[ $DESKTOP_SESSION == /usr/share/xsessions/plasma-bspwm ]]; then
  run sxhkd -c $HERE/sxhkd/sxhkdrc &> /dev/null &
  run picom -b --config $HERE/picom.conf --experimental-backends &> /dev/null &
  latte
else
  run sxhkd -c $HERE/sxhkd/sxhkdrc.bk &> /dev/null &
  run picom -b --config $HERE/picom.conf --experimental-backends &> /dev/null &
  run polybar -c $HERE/polybar/config.ini mainbar &> /dev/null &
  run polybar -c $HERE/polybar/config.ini barbelow &> /dev/null &
fi
#exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

#polybar -c $HERE/polybar/config.ini mainbar &> /dev/null &
#polybar -c $HERE/polybar/config.ini barbelow &> /dev/null &

#change your keyboard if you need it
#setxkbmap -layout be

#Some ways to set your wallpaper besides variety or nitrogen
#feh --bg-fill ~/Pics/Wallpaper/dark_forrest.jpg &

#xsetroot -cursor_name left_ptr &

#conky -c $HERE/conky/system-overview.conf &
#conky -c $HERE/conky/conky-overview.conf &
#conky -c $HERE/conky/Neo/conky.lua
#conky -c $HERE/conky/con-clock.rc &
#conky -c $HERE/conky/keybindings-overview.conf &
#run variety &
#run nm-applet &
#run pamac-tray &
#run xfce4-power-manager &
#numlockx on &
# blueberry-tray &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#/usr/lib/xfce4/notifyd/xfce4-notifyd &
#run volumeicon &
#nitrogen --restore &
#run caffeine &
#run vivaldi-stable &
#run firefox &
#run thunar --daemon &
#run dropbox &
#run insync start &
#run discord &
#run spotify &
