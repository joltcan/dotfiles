#!/bin/bash
# Fredrik Lundhag, f@mekk.com
#
# Screen names, as shown with xrandr
IN="eDP1"
EXT1="DP2-1"
EXT2="DP2-2"
LOG=/tmp/toggle.log
export DISPLAY=:0.0

if (xrandr |grep "$EXT1 disconnected" >/dev/null ); then
    echo "$(date ) internal" >> $LOG
	#xrandr --output $EXT1 --off --output $EXT2 --off --output $IN --auto
	xrandr --output $IN --auto >> $LOG 2>&1
else
    echo "$(date) external" >> $LOG 2>&1
	xrandr --output $IN --auto >> $LOG 2>&1
	xrandr --output $EXT1 --auto --primary --pos 0x120 --output $EXT2 --auto --pos 2560x0 --rotate left --output $IN --left-of $EXT1 >> $LOG 2>&1 &
fi

i3-msg reload
nitrogen --restore

