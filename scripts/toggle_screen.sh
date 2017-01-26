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
LOG=/tmp/toggle.log
#export DISPLAY=:0.0

if (xrandr |grep "$EXT1 disconnected" >/dev/null ); then
    echo "$(date ) internal" >> $LOG
	#xrandr --output $EXT1 --off --output $EXT2 --off --output $IN --auto
	xrandr --output $IN --auto >> $LOG 2>&1
else
    echo "$(date) external" >> $LOG 2>&1
	xrandr --output $IN --off >> $LOG 2>&1
	xrandr --output $EXT1 --auto --primary --pos 0x120 --output $EXT2 --auto --pos 2560x0 --rotate left >> $LOG 2>&1
    # fix for usb stuff when moving from laptop only to dock
    echo 'on' | sudo tee '/sys/bus/usb/devices/1-4.3/power/control' # keyboard
    echo 'on' | sudo tee '/sys/bus/usb/devices/1-4.4.2/power/control' # mouse
fi

if [ "$0" == "/usr/local/sbin/thinkpad-dock.sh" ]; then
    if [ "$1" == "undocked" ]; then sudo tlp bat >> $LOG ; fi
    if [ "$1" == "docked" ]; then sudo tlp ac >> $LOG;  fi
fi

if [ "$USER" == "root" ] ; then
    DISPLAY=:0.0 su jolt -c "nitrogen --restore"
else
    nitrogen --restore
fi
