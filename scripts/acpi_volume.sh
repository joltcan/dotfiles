#!/bin/bash

# This script is called by volumeup/volumedown/volumemute files in /etc/acpi/events
# since my thinkpad didn't map this correctly. I have symlinked this file to 
# /usr/local/bin/
# Also, I don't use pactl since they dont want to be run as root.

# event=button/volumedown.*
#action=/usr/local/bin/acpi_volume.sh down
#event=button/mute.*
#action=/usr/local/bin/acpi_volume.sh mute
#event=button/volumeup *
#action=/usr/local/bin/acpi_volume.sh up

case $1 in
"up")
	amixer sset Master 10+
	;;
"down")
	amixer sset Master 10-
	;;
"mute")
    # ugly workaround since amixer Master mute will mute both master and Headphone/speaker
    # and toggling them in different order is confusing
    if amixer get Master |grep -v grep | grep "off"; then
        amixer -q sset Master on 
        amixer -q sset Speaker on
        amixer -q sset Headphone on
    else
        amixer -q sset Master off
        amixer -q sset Speaker off
        amixer -q sset Headphone off
    fi
	;;
*)
	;;
esac
