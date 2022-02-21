#!/bin/sh
scrot ~/pictures/ss/%Y-%m-%d-%T-screenshot.png -e 'xclip -selection clipboard -t image/png -i $f'
