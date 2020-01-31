#!/usr/bin/env bash

wirelessTransfer=$(iwconfig wlo1 | grep Bit | cut -d '=' -f 2 | cut -d ' ' -f 1-2)
wirelessSignal=$(iwconfig wlo1 | grep Bit | awk '{print $4 " " $5}' | cut -d '=' -f 2)
wirelessList=$(cat /proc/net/wireless | wc -l)
up=$(cat /proc/net/dev | grep wlo1 | awk '{print $10/1024/1024}')
ping=$(ping 8.8.8.8 -c 1 | tail -n 1 | cut -d '/' -f 5)
publicIP=$(ifconfig wlo1 | rg mask | awk '{print $2}'| cut -f2 -d:)
#privateIP=$(curl http://checkip.amazonaws.com)
# Check if on wifi
if (( wirelessList > 2 )); then
    echo " $publicIP | $wirelessTransfer   | $wirelessSignal  | ... $ping ms "
else 
    echo " $down MB/s  | $up MB/s  | ... $ping ms "
fi

sleep 15