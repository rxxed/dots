setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'

while true; do
    dwmautostart && dwm > /dev/null 2>&1
done
