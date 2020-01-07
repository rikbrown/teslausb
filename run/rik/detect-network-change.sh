#!/bin/sh
rm -f /tmp/last_ssid
touch /tmp/last_ssid

while [ 1 ]; do
        current_ssid=$(iwgetid -r)
        last_ssid=$(cat /tmp/last_ssid)
        if [ "$current_ssid" != "$last_ssid" ]; then
                echo "network changed ($last_ssid -> $current_ssid)"
                /root/bin/rik/on-network-change.sh
        fi
        echo $current_ssid > /tmp/last_ssid
        sleep 10
done