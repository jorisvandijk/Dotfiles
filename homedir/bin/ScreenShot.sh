#!/bin/sh
scrot ~/Pictures/%Y-%m-%d-%T-screenshot.png -e 'xclip -selection clipboard -t image/png -i $f'