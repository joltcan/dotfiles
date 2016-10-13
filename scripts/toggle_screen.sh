#!/bin/bash
# Fredrik Lundhag, f@mekk.com
#
# Either run this script manually, or use it as an event in /etc/acpi/events:
# Your dock station event needs to be captured with acpi_listen, and it will
# probably differ from mine. Here is my /etc/acpi/events/lenovo-t460-undock:
# event=ibm/hotkey LEN0068:00 00000080 *
# action=/usr/local/bin/toggle_screen.sh
# This file is then symlinked as above ^

# Screen names, as shown with xrandr
IN="eDP1"
EXT1="DP2-1"
EXT2="DP2-2"

if (xrandr | grep "$EXT1 disconnected"); then
	xrandr --output $EXT1 --off --output $EXT2 --off --output $IN --auto
    # lock just in case
	xautolock -locknow
else
	xrandr --output $EXT1 --auto --primary --output $EXT2 --auto --left-of $EXT1
	#xrandr --output $IN --auto --output $EXT1 --auto --left-of $IN --primary
	#xrandr --output $EXT2 --auto --left-of $EXT1
fi

