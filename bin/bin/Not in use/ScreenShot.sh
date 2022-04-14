#!/bin/sh
scrot ~/Pictures/ss/%Y-%m-%d-%T-screenshot.png -e 'xclip -selection clipboard -t image/png -i $f'
