#!/bin/bash

# This script is called by volumeup/volumedown/volumemute files in /etc/acpi/events
# since my thinkpad didn't map this correctly. I have symlinked this file to 
# /usr/local/bin/
# Also, I don't use pactl since they dont want to be run as root.
# Thanks to https://wiki.archlinux.org/index.php/PulseAudio/Examples

# event=button/volumedown.*
#action=/usr/local/bin/acpi_volume.sh down
#event=button/mute.*
#action=/usr/local/bin/acpi_volume.sh mute
#event=button/volumeup *
#action=/usr/local/bin/acpi_volume.sh up

USER_NAME=$(ps aux|grep [i]3 -m1|awk '{print $1}')
USER_ID=$(id -u "$USER_NAME")
export PULSE_SERVER="unix:/run/user/"$USER_ID"/pulse/native"

case $1 in
"up")
    su -c "pactl --server \"$PULSE_SERVER\" set-sink-volume 0 +6%" "$USER_NAME"

	;;
"down")
    su -c "pactl --server \"$PULSE_SERVER\" set-sink-volume 0 -6%" "$USER_NAME"

	;;
"mute")
	su -c "amixer -q -D pulse sset Master toggle" jolt
	;;
*)
	;;
esac
