#!/bin/zsh

SELECTION="$(printf "  Lock\n󰤄  Suspend\n󰍃  Log out\n  Hibernate\n  Reboot\n󰚦  Shutdown" | fuzzel --dmenu -l 6 -p "")"

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
