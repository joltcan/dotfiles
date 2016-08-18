# Lenovo Thinkpad T460s

## Buttons

Under Ubuntu 16 the up/down/mute volume buttons where not mapped to the correct XF86-keycodes, so I created these acpi-events to do the mapping for me.

I choosed to use amixer instead of pactl due to the user permission issue (events are run as root).

Add the files in events to /etc/acpi/events, modify the action-part to be some folder where you put volume.sh.

To complete the task, also reload acpid (sudo service acpid restart)

## Lid open/close

This is the configs I've modified for acpid to register close/open event and run screensaver on open.

```
root@SEMALL0404:/etc/acpi# cat events/lm_lib 
event=button/lid.*
action=/etc/acpi/lid.sh %e
root@SEMALL0404:/etc/acpi# cat lid.sh 
#!/bin/bash

echo $*  >> /tmp/lid.log
#!/bin/sh
case "$3" in
    close) 
		echo -n mem >/sys/power/state 
	;;
	open)
		DISPLAY=:0 su -c slock jolt
	;;

	*)    logger "ACPI action undefined: $3" ;;
esac

