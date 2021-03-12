#!/bin/bash


## Checking parameters
opt_force=false

paramArray=( "$@" )
paramCount=${#paramArray[@]}

for (( index=0; $index<$paramCount; index++ ))
do
	thisParam="${paramArray[$index]}"
	
	if [ "$thisParam" == "-f" ] || [ "$thisParam" == "--force" ]
	then
		opt_force=true
	fi
done


if [ -f $HOME/.xinitrc ]
then
	if [ ! $DISPLAY ]
	then
		if [ $opt_force == true ]
		then
			answer="Yes"
		else
			read -p "execute startx? [y/N]: " answer
		fi

		if [ "${answer:0:1}" == "y" ] || [ "${answer:0:1}" == "Y" ]
		then
			startx
		fi
	fi
fi

