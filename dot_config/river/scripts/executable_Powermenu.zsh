#!/bin/zsh

SELECTION="$(printf "1 - Lock\n2 - Suspend\n3 - Log out\n4 - Hibernate\n5 - Reboot\n6 - Shutdown" | fuzzel --dmenu -l 6 -p "")"

case $SELECTION in
	*"Lock")
		swaylock;;
	*"Suspend")
		systemctl suspend;;
	*"Log out")
		riverctl exit;;
	*"Hibernate")
		systemctl hibernate;;
	*"Reboot")
		systemctl reboot;;
	*"Shutdown")
		systemctl poweroff;;
esac
