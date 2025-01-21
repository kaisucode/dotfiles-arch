#!/bin/bash

logfile="/tmp/bspwm_external_rules.log"

window_id="$1"
window_class="$2"

TITLE=$(xprop -id "$1" WM_NAME | cut -d '"' -f 2)

echo "window id: $window_id" >> "$logfile"
echo "window class: $window_class" >> "$logfile"
echo "title: $TITLE" >> "$logfile"

#dunstify "title" "$TITLE"
#dunstify "window id" "$window_id"
#dunstify "window class" "$window_class"

#if [ "$window_class" = "Blender" ]; then
#	echo "opened blender" >> "$logfile";
#	#dunstify "hi" "blender";
#
#	if [ "$TITLE"="Blender Preferences" ]; then
#		echo "state=floating rectangle=1000x700+0+0 center=on"
#	elif [ "$TITLE"="Blender Render" ]; then
#		echo "state=floating rectangle=1980x1200+0+0 center=on"
#	fi
#elif [ "$2" = "Godot_Engine" ]; then
if [ "$2" = "Godot_Engine" ]; then
	echo "opened godot" >> "$logfile";
	echo "state=floating rectangle=1280x800+0+0 center=on"
fi

