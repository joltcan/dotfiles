#!/bin/bash
card=0
LOG=/tmp/vol.log

echo "$*" >> $LOG
case $1 in
"up")
	amixer sset Master 10+
	;;
"down")
	amixer sset Master 10-
	;;
"mute")
	amixer sset Master toggle
	;;
*)
	;;
esac
