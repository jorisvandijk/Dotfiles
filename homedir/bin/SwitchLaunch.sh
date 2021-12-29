#!/usr/bin/env bash

# This script requires wmctrl
i3-msg workspace "${1^}"

if [ $1 == newsboat ]; then
    wmctrl -x -a "$1" || kitty --hold --detach --class newsboat -e newsboat
else
    wmctrl -x -a "$1" || $1
fi