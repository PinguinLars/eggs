#!/bin/sh
upower -m | while read -r line; do 
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state" | grep -o --color=never '\w*$'
done
