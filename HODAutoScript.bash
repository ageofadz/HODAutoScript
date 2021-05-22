#!/bin/bash
 
#get params
 
while getopts ":m:w:s:" opt; do
 
	case ${opt} in
		m ) #Month option
		M=${OPTARG}
		;;
		w ) #Week option
		W=${OPTARG}
		;;
		s ) #Week option
		S=${OPTARG}
		;;
		y ) #Year option
		M=${OPTARG}
		;;
		?) #Other option
		echo "Usage: HODAutoScript [-m] Months [-w] Weeks [-s] Symbols (Comma-Deliniated)"
		exit 1
		;;
	esac
done
 
#No option
if [ $# -lt 1 ]; then 
	echo "Usage: HODAutoScript [-m] Months [-w] Weeks [-s] Symbols (Comma-Deliniated)"
	exit 1
fi
 
#Saves CSV
ExportWindow()
{
	sleep 1
	xdotool mousemove 1420 88 click 1
	xdotool mousemove 1342 249 click 1
	xdotool mousemove 625 548 click 1
	sleep 1
	xdotool key Right
	xdotool key Right
	xdotool key Right
	xdotool type _$1
	xdotool mousemove 865 626 click 1
	sleep 2
}
 
#Sets time of day
SetTime()
{
	sleep 1
	xdotool mousemove 1154 102 click 1
	sleep 1
	xdotool mousemove 1220 54 click 1
	sleep .1
	wmctrl -a debian10.linuxvmimages.local
	sleep .5
	wmctrl -a main@thinkorswim
	sleep .5
	xdotool mousemove 1216 286 click 1
	sleep .1
	xdotool mousemove 1210 288 click 1
	sleep .1
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	sleep .1
	xdotool type $10
	sleep .5
	xdotool key Return
	sleep .5
	xdotool mousemove 1270 290 click 1
	sleep 8
}
 
#Moves to end of day, increments hours forward, then moves to open price
DayMove()
{
	sleep 1
	xdotool mousemove 1154 102 click 1
	sleep 1
	xdotool mousemove 1220 54 click 1
	sleep 1
	wmctrl -a debian10.linuxvmimages.local
	sleep .5
	wmctrl -a main@thinkorswim
	sleep .5
	xdotool mousemove 1216 286 click 1
	sleep .1
	xdotool mousemove 1210 288 click 1
	sleep 1
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	sleep 1
	xdotool type 23:50:00
	sleep 1
	xdotool key Return
	sleep 1
	xdotool mousemove 1270 290 click 1
	sleep 2.5
	xdotool mousemove 1271 65 click 1
	xdotool mousemove 1271 65 click 1
	xdotool mousemove 1271 65 click 1
	xdotool mousemove 1271 65 click 1
}
 
 
#Sets symbol, exports open and close, then moves to next day
Day()
{
	SetSymbol $S
	SetTime "8:35:0"
	ExportWindow "Open"
	SetTime "15:00:0"
	ExportWindow "Close"
	DayMove
}
 
Week()
{
	Day
	Day
	Day
	Day
	Day
	DayMove
	DayMove
}
 
#Expands option chain
Expand()
{
	SetSymbol $S
	xdotool mousemove 1366 209 click 1
}
 
Month()
{
	Expand
	Week
	Week
	Week
	Week
}
 
#Sets symbol in search bar to parameter and hits return
SetSymbol()
{
	xdotool mousemove 352 108 click 1
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool key BackSpace
	xdotool type $1
	sleep .5
	xdotool key Return
}
 
 
 
#Runs according to parameters
 
for ((i=1; i<=$M; i++)); do
	Month
done
 
for ((i=1; i<=$Y; i++)); do
	Month
	Month
	Month
	Month
	Month
	Month
	Month
	Month
	Month
	Month
	Month
	Month
done
 
 
for ((i=1; i<=$Y; i++)); do
	Year
done