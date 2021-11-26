#!/usr/bin/env bash

# IFS=',' read -a Fields <<< "$(i3-msg -t get_workspaces)"

# for Field in "${Fields[@]}"; {
#     case $Field in
#         \"num\":*) Target=$Field ;;
#     esac
# }

# printf '%s\n' "${Target#*:}"

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

  if [ $1 == "newsboat" ]; then
    i3-msg workspace $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1)) && kitty --hold --detach --class newsboat -e newsboat &
  fi

  i3-msg workspace $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1)) && $1 &
fi


# libreoffice soffice.bin


# if pgrep -x "GeckoMain" > /dev/null; then
# 	echo "Running"
  
# else
# 	echo "Not running"
  
# fi
# echo $1

  # check=$(ps aux | grep -i "GeckoMain" | wc -l)
  # if [[ $check -eq "1" ]] ; then
  #   echo "not running"
  #   exit;
  # else
  #   echo "running"
  #   exit;
  # fi