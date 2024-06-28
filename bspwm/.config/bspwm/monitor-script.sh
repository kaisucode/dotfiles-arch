#!/bin/sh

monitor_resolution="3840x2160"
#monitor_resolution="1920x1080"
#monitor_resolution="2048x1536"
#monitor_resolution="2560x1600"
monitor_name="HDMI-1-2"

#display_resolution="2560x1600"
#display_resolution="2048x1152"
display_resolution="1920x1200"
display_name="eDP-1"


if xrandr -q | grep -w "HDMI-1-2 connected"; 
then 
	echo "Monitor connected"; 

	xrandr --output $monitor_name --primary --mode $monitor_resolution --rotate normal --output $display_name --mode $display_resolution --rotate normal --right-of $monitor_name

	bspc monitor $monitor_name -d 1 2 3 4
	bspc monitor $display_name -d 5 6 7 8
else
	xrandr --output $display_name --primary --mode $display_resolution --rotate normal --scale "1.0x1.0"
	bspc monitor $display_name -d 1 2 3 4 5 6 7 8
fi

