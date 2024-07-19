#!/bin/zsh

# Import Current Theme
iDIR="$HOME/.config/river/icons"

dir="/home/mukul/Pictures/ScreenShot"
vidDir="/home/mukul/Pictures/ScreenRecord"
file="$(date +%Y%m%d-%H%M%S).jpeg"
vidfile="$(date +%Y%m%d-%H%M%S).mp4"

option_1="  Capture Desktop"
option_2="  Capture Area"
option_3="  Record Video"
option_4="󰨤  Record Area"
option_5="  Stop Recording"

capture_screen() {
	grim -t jpeg -q 100 ${dir}/${file}
	notify-send -i ${iDIR}/picture.png ${notify_cmd_shot} "Screenshot Captured"
}

capture_area() {
	grim -g "$(slurp)" -t jpeg -q 100 ${dir}/${file}
	notify-send -i ${iDIR}/picture.png ${notify_cmd_shot} "Area Captured"
}

record_video() {
	wf-recorder --audio -f ${vidDir}/${vidfile} -o "eDP-1" &
	notify-send -i ${iDIR}/picture.png ${notify_cmd_shot} "Recording Started"
}

record_area() {
	wf-recorder -g "$(slurp)" --audio -f ${vidDir}/${vidfile} &
	notify-send -i ${iDIR}/picture.png ${notify_cmd_shot} "Recording Started"
}

stop() {
	killall -s SIGINT wf-recorder
	notify-send -i ${iDIR}/picture.png ${notify_cmd_shot} "Recording Stopped"
}

run() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | fuzzel --dmenu -l 5 -p "> "
}

run_cmd() {
	if [[ "$1" = '--opt1' ]]; then
		capture_screen
	elif [[ "$1" = '--opt2' ]]; then
		capture_area
	elif [[ "$1" = '--opt3' ]]; then
		record_video
	elif [[ "$1" = '--opt4' ]]; then
		record_area
	elif [[ "$1" = '--opt5' ]]; then
		stop
	fi
}

chosen="$(run)"
case ${chosen} in
"$option_1")
	run_cmd --opt1
	;;
"$option_2")
	run_cmd --opt2
	;;
"$option_3")
	run_cmd --opt3
	;;
"$option_4")
	run_cmd --opt4
	;;
"$option_5")
	run_cmd --opt5
	;;
esac
