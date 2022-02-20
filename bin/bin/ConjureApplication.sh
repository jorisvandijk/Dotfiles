#!/bin/sh

wmctrl -i -R $(wmctrl -l | fzf | cut -d\  -f1)