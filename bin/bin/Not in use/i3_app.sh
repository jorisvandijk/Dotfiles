#!/usr/bin/env bash

if [ $1 == "firefox" ]; then
  set -- "GeckoMain"
fi

if [ $1 == "libreoffice" ]; then
  set -- "soffice.bin"
fi

# if program is already running...
if pgrep -x "$1" > /dev/null; then
	
  if [ $1 == "GeckoMain" ]; then
    set -- "firefox"
  fi
  	
  if [ $1 == "soffice.bin" ]; then
    set -- "libreoffice"
  fi

  i3-msg '[class=(?i)'$1'] focus' 
  
# or if program isn't running...  
else
	
  if [ $1 == "GeckoMain" ]; then
    set -- "firefox" 
  fi
     
  if [ $1 == "soffice.bin" ]; then
    set -- "libreoffice" 
  fi

  if [ $1 == "mpv" ]; then
    set -- "newsboat" 
  fi

  if [ $1 == "newsboat" ]; then
    kitty --hold --detach --class newsboat -e newsboat 
    sleep .5
    i3-msg '[class=(?i)'$1'] focus' 
  fi

  $1 &

  if [ $1 == "ferdi" ]; then
    sleep 1 
  fi

  fi
  sleep 1
  i3-msg '[class=(?i)'$1'] focus' 

fi