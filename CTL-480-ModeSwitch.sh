#!/bin/bash
#This script switches between Absolute and relative mode of the Stylus and Eraser of a Wacom CTL-480 tablet


#Getting the name of each devices of the tablet
idStylus=$(xsetwacom --list devices | grep "stylus"| sed "s/[ ]*	id:.*//g")
idEraser=$(xsetwacom --list devices | grep "eraser" | sed "s/[ ]*	id:.*//g")
#idPad=$(xsetwacom --list devices | grep "pad" | sed "s/  	id:.*//g")

#Displaying found names
echo $idStylus
echo $idEraser
#echo $idPad

#Geting parameters for mode (absolute/relative)
modeStylus=$(xsetwacom get "$idStylus" mode)
modeEraser=$(xsetwacom get "$idEraser" mode)
echo -e "Actual mode for $idStylus is $modeStylus \n"
echo -e "Actual mode for $idEraser is $modeEraser \n"

#Switching mode
#For Stylus
echo -e "Now Switching \n"
if [ "$modeStylus" == "Absolute" ]; then
	echo `xsetwacom set "$idStylus" mode relative`
else
	echo `xsetwacom set "$idStylus" mode absolute`
fi
#For Eraser
if [ "$modeEraser" == "Absolute" ]; then
	echo `xsetwacom set "$idEraser" mode relative`
else
	echo `xsetwacom set "$idEraser" mode absolute`
fi


#Geting parameters for mode (absolute/relative), again
modeStylus=$(xsetwacom get "$idStylus" mode)
modeEraser=$(xsetwacom get "$idEraser" mode)
echo -e "New mode for $idStylus is $modeStylus \n"
echo -e "New mode for $idEraser is $modeEraser \n"
echo -e "\033[0;0mwill now exit"
sleep 10
