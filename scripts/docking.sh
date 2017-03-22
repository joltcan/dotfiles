#!/bin/bash
# Fredrik Lundhag, f@mekk.com
#
# Either run this script manually, or use it as an event in /etc/acpi/events:
# Your dock station event needs to be captured with acpi_listen, and it will
# probably differ from mine. Here is my /etc/acpi/events/lenovo-t460-undock:
# event=ibm/hotkey LEN0068:00 00000080 *
# action=/home/jolt/dotfiles/scripts/docking.sh

export DISPLAY=:0.0

LOG=/tmp/dock.log

if [ "$USER" == "root" ] ; then
    if [ "$1" == "undocked" ]; then 
        tlp bat >> $LOG 
        sleep 5 ; su -c /home/jolt/dotfiles/scripts/toggle_screen.sh jolt >> $LOG
    fi
    if [ "$1" == "docked" ]; then 
        tlp ac >> $LOG
        # fix for usb stuff when moving from laptop only to dock
        echo 'on' | tee '/sys/bus/usb/devices/1-4.3/power/control' # keyboard
        echo 'on' | tee '/sys/bus/usb/devices/1-4.4.2/power/control' # mouse
        sleep 5 ; su -c /home/jolt/dotfiles/scripts/toggle_screen.sh jolt >> $LOG
    fi
fi


