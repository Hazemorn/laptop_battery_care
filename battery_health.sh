#!/bin/bash

#ls /sys/class/power_supply
echo -n "Hello! Write battery percent(%): (or type 1 for 60 % of charge or 2 for 80 % of charge) "
read bat_percent
if [ $bat_percent -ge 1 ]; then
		echo 60 | sudo tee /sys/class/power_supply/BAT1/charge_control_end_threshold
elif [ $bat_percent == 2 ]; then
   		echo 80 | sudo tee /sys/class/power_supply/BAT1/charge_control_end_threshold
elif [ $bat_percent -ge 0 ] && [ $bat_percent -le 100 ]; then
   		echo $bat_percent | sudo tee /sys/class/power_supply/BAT1/charge_control_end_threshold
else
   		echo "Something wrong. Please enter a valid max limit between 1 and 100"
fi
