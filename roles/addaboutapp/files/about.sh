#!/bin/bash

devs=$(ip r | grep def | awk -F ' ' '{ print $5}')
ipaddresses=""
printer=$(lpstat -s | grep "назначение системы по умолчанию:" | awk -F ' ' '{print $5}')
for devn in $devs
do
    ipaddress=$(ip -f inet a show dev $devn | grep "inet" | awk -F' ' '{ print $2 }')
    ipaddresses=${ipaddresses}$(echo -e "\n${ipaddress}")
    macaddress=$(ip -f link a show dev $devn | grep "link/ether" | awk -F' ' '{ print $2 }')
    macaddresses=${macaddresses}$(echo -e "\n${macaddress}")
done
pcname=$(hostname)
getip=$(echo $ipaddresses | head -n1 | awk -F ' ' '{print $1}')
getmac=$(echo $macaddresses | head -n1 | awk -F ' ' '{print $1}')
namberroom=$(curl -G "http://192.168.5.186/pcs/?value=$pcname|$getip||$getmac")
text="Имя компьютера: $pcname
IP-адрес: $ipaddresses
MAC-адрес: $macaddresses
Принтер: $printer
Номер кабинета: $namberroom"
notify-send "Информация о компьютере:" "<b>$text</b>" -t 30000 -i "emblem-important"
echo "$namberroom" > ~/.room
