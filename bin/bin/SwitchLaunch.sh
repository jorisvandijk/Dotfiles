#!/usr/bin/env bash

# Open app or switch to it (raise/launch)
# Joris van Dijk | https://gitlab.com/jorisvandijk
# Published under GPL-3.0-or-later
# This script requires wmctrl, i3-msg and kitty.

i3-msg workspace "${1^}"

if [ $1 == newsboat ]; then
    wmctrl -x -a "mpv" || wmctrl -x -a "$1" || kitty --hold --detach --class newsboat -e newsboat
else
    wmctrl -x -a "$1" || $1
fi
