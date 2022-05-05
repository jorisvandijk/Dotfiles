#!/usr/bin/env bash
#
# Script name: 	info.sh
# Author:		Joris van Dijk
# Author URL:	gitlab.com/jorisvandijk 
# License:		GNU General Public License v3.0
# 
# Dependencies: acpi
# Usage:		Run script
# Description: 	Show time, date and battery information.

# notify-send -u normal -t 5000 "$(
    # printf "$(date "+%A %-d/%-m/%Y")\n"
    # printf "$(date "+%H:%M")\n\n"
    # bat=$(acpi | head -1 | awk {'print $3'})
    # if [[ $bat == Charging, ]]; then
        # echo $(acpi | head -1 | awk '{print substr($4, 1, length($4)-1)}'; echo ' charging')
    # else
        # echo $(acpi | head -1 | awk '{print substr($4, 1, length($4)-1)}')
    # fi
    # printf "$(nmcli -t -f name connection show --active)\n"
    # printf "$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)"
    # 
# )"

notify-send -u normal -t 5000 "$(
    printf "$(date "+%H:%M")\n"
    printf "$(date "+%A %-d/%-m/%Y")\n"
    bat=$(acpi | head -1 | awk {'print $3'})
    if [[ $bat == Charging, ]]; then
        echo $(acpi | head -1 | awk '{print substr($4, 1, length($4)-1)}'; echo ' charging')
    else
        echo $(acpi | head -1 | awk '{print substr($4, 1, length($4)-1)}')
    fi
    
)"
