#!/bin/bash

revert() {
	xset dpms 0 0 0
}
trap revert SIGHUP SIGINT SIGTERM
xset +dpms dpms 60 60 300

#xset -display :0.0 dpms 400 500 600
# pause spotify (sp from https://gist.github.com/wandernauta/6800547 )
#sp pause

#i3lock -p win -c 000000 -i ~/Dropbox/Bilder/BG/san-diego-wide.png
br=$(cat /sys/class/backlight/intel_backlight/brightness)
if [ "$br" -lt "150" ] 
then
     echo 188 | sudo tee /sys/class/backlight/intel_backlight/brightness
fi
/usr/local/bin/lock -p -t "" -- scrot -z
revert

if [ "$USER" == "root" ]; then
    su -c 'xmodmap -e "clear Lock" -e "keycode 0x42 = Escape"' jolt
else
    xmodmap -e "clear Lock" -e "keycode 0x42 = Escape"
fi
