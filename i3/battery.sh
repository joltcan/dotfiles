#!/bin/bash
bat0=$(cat /sys/class/power_supply/BAT0/capacity)
bat1=$(cat /sys/class/power_supply/BAT1/capacity)
totalbat=$(( (bat0+bat1)/2))

power=$(cat /sys/class/power_supply/AC/online)
if [ $power -eq 0 ]; then
	ac="⚡"
else
	ac="⚇ "
fi

echo "$ac $totalbat"
test ${totalbat%} -le 10 && exit 33 || exit 0

