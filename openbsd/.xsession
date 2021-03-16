xterm -name termbar -class termbar -e /home/jolt/scripts/bashbar &
xrdb -merge ~/.Xresources
feh --bg-fill /home/jolt/pictures/bg/hackersbg.png

xidle -timeout 3600 &

# disable system beep
xset b off

# use caps lock as ctrl key
setxkbmap -option ctrl:nocaps

# used to create transparent window
xcompmgr -c -o.2 &

# display system monitor
conky --config=~/.conkyrc &

cwm
