#!/bin/bash

xset -dpms
xset -display :0.0 dpms force off 
i3lock -n -t -i ~/Dropbox/Bilder/BG/pluto_bg.png

killall i3lock

