#!/bin/bash

revert() {
	xset dpms 0 0 0
}
trap revert SIGHUP SIGINT SIGTERM
xset +dpms dpms 60 60 300

#xset -display :0.0 dpms 400 500 600
# pause spotify (sp from https://gist.github.com/wandernauta/6800547 )
sp pause

#i3lock -p win -c 000000 -i ~/Dropbox/Bilder/BG/san-diego-wide.png
/usr/local/bin/lock -p -t "" -- scrot -z
revert
