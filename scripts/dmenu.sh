#!/bin/bash
compgen -c | sort -u | sk | xargs -r swaymsg -t command exec