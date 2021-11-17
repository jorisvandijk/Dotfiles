#!/bin/bash

if pgrep -x "$1" > /dev/null; then
	echo "Running"
  i3-msg '[class=(?i)'$1'] focus' 
else
	echo "Not running"
  i3-msg workspace $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1)) && $1 &
fi

# firefox doesn't work
# libreoffice soffice.bin