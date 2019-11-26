#!/bin/bash

dev=$(ip r | grep def | awk -F ' ' '{ print $5}' | head -n1)
getip=$(ip -f inet a show dev $dev | grep "inet" | awk -F' ' '{ print $2 }' | awk -F '/' '{ print $1 }' | head -n1)
getmac=$(ip -f link a show dev $dev | grep "link/ether" | awk -F' ' '{ print $2 }')
pcname=$(hostname)
room="$(curl -G "http://192.168.5.186/pcs/?host=$pcname&ip=$getip&mac=$getmac" | awk -F 'Room: ' '{ print $2 }' | sed 's/<br>//')"
if [ "$room" != ' ' ]; then
    echo $room > /opt/crwp/.room
fi
export DISPLAY=:0
/opt/crwp/crwp

PATHTOPIC="/opt/crwp/default_background.jpg"
dconf write /org/mate/desktop/background/picture-filename "'$PATHTOPIC'"
