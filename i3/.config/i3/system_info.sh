#!/bin/bash
#
# Usage: Notify-send current system info, called from the
#        i3 config file by bindsym.
#
# Script by Joris van Dijk | gitlab.com/jorisvandijk 
#
#          Published under GPL-3.0-or-later

notify-send -u normal -t 15000 "$(
    echo $(date +"%A %-d %B %Y"; echo " - "; date +"%R")
    echo
    bat=$(acpi | awk {'print $3'})
    if [[ $bat == Charging, ]]; then
        echo $(echo "Battery at"; acpi | awk '{print substr($4, 1, length($4)-1)}'; echo "and charging")
    else
        echo $(echo "Battery at"; acpi | awk '{print substr($4, 1, length($4)-1)}')
    fi
)"
