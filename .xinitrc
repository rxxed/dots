#!/usr/bin/sh
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'

xset fp+ $HOME/misc/fonts
xset fp rehash

while true; do
    dwmautostart && dwm > /dev/null 2>&1
done

#exec xmonad
#dbus-launch startxfce4
