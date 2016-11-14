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
	su -c "pactl set-sink-volume 0 +6%  && pactl set-sink-mute 0 0" jolt

	;;
"down")
	su -c "pactl set-sink-volume 0 -6%  && pactl set-sink-mute 0 0" jolt

	;;
"mute")
	su -c "amixer -q -D pulse sset Master toggle" jolt
	;;
*)
	;;
esac
