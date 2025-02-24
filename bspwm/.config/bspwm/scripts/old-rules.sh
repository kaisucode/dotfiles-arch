#/bin/bash

logfile="/tmp/bspwm_external_rules.log"

window_id="$1"
window_class="$2"


#TITLE=$(xdotool getwindowname $1)
TITLE=$(xprop -name $1 WM_NAME | cut -d '"' -f 2)


echo "window id: $window_id" >> "$logfile"
echo "window class: $window_class" >> "$logfile"
echo "title: $TITLE" >> "$logfile"

# should be "Godot_Engine"
#APP=$(xprop -name $1 WM_CLASS | cut -d '"' -f 2)

dunstify "1" $2
dunstify "2" $2
dunstify "title" $TITLE

if [ "$2" = "Blender" ]; then
	echo "opened blender" >> "$logfile"
	#echo "state=floating rectangle=1980x1200+0+0 center=on"
	#echo "state=floating rectangle=1280x800+0+0 center=on"
	dunstify "hi" "blender"
	if [ "$TITLE" = "Blender Preferences" ]; then
		echo "state=floating rectangle=1000x700+0+0 center=on"
	elif [ "$TITLE" = "Blender Render" ]; then
		echo "state=floating rectangle=1980x1200+0+0 center=on"
	fi
elif [ "$2" = "Godot_Engine" ]; then
	echo "opened godot" >> "$logfile"
	dunstify "hi" "Godot"
	#echo "state=floating rectangle=1980x1200+0+0 center=on"
	echo "state=floating rectangle=1280x800+0+0 center=on"
fi


#elif [ "$2" = "steam" ]; then
#	if [ "$TITLE" = "Friends List" ]; then
#		echo "state=floating rectangle=1000x700+0+0 center=on"
#	elif [ "$TITLE" = "Steam" ]; then
#		echo "state=floating rectangle=1700x900+0+0 center=on hidden=on"
#	elif [ "$TITLE" = "Sign in to Steam" ]; then
#		echo "state=floating rectangle=300x400+2235+655"
#	fi


# bspwm external rules

# source: modified from
# https://pastebin.com/MXeDJzze
# https://www.reddit.com/r/bspwm/comments/14km8ka/comment/jprhop4/

