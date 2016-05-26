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
EXT="DP2-2"

if (xrandr | grep "$EXT disconnected"); then
	xrandr --output $EXT --off --output $IN --auto
else
	xrandr --output $IN --auto --output $EXT --auto --left-of $IN --primary
fi
