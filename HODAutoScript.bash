#!/bin/bash

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


Day()
{
SetSymbol "VIX"
SetTime "8:35:0"
ExportWindow "Open"
SetTime "15:00:0"
ExportWindow "Close"
SetSymbol "SPX"
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

Expand()
{
SetSymbol "VIX"
xdotool mousemove 1366 209 click 1
SetSymbol "SPX"
xdotool mousemove 1366 209 click 1
}

Month()
{
Week
Week
Week
Week
}

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

Month
Month
Expand
Month
Month
Expand
Month
Month
Expand
Month
Month
Expand
Month
Month
Expand
Month
Month
Expand
Month
Month
Month
