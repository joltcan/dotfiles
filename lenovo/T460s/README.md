# Lenovo Thinkpad T460s

* Under Ubuntu 16 the up/down/mute volume buttons where not mapped to the correct XF86-keycodes, so I created these acpi-events to do the mapping for me.

I choosed to use amixer instead of pactl due to the user permission issue (events are run as root).

Add the files in events to /etc/acpi/events, modify the action-part to be some folder where you put volume.sh.

To complete the task, also reload acpid (sudo service acpid restart)

