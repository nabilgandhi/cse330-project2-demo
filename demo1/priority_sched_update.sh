#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "      $0 1"
    echo "              or"
    echo "      $0 2"
    exit
fi

dmesg -C

if [ $1 -eq 1 ]; then
	echo "Executing test #1"
	echo "Setting priorities for 10 processes"
	
	pid=( $(pgrep -f user_process_generator) )
	len=$(( ${#pid[@]} - 1 ))
	
	for i in $( seq 0 $len )
	do
		if [[ $i == 0 ]]
		then
			echo "chrt -o -p 0 ${pid[$i]}"
			chrt -o -p 0 ${pid[$i]}
		elif [[ $i == 1 ]]
		then
			echo "chrt -f -p 98 ${pid[$i]}"
			chrt -f -p 98 ${pid[$i]}
		elif [[ $i == 2 ]]
		then
			echo "chrt -r -p 97 ${pid[$i]}"
			chrt -r -p 97 ${pid[$i]}
		elif [[ $i == 3 ]]
		then
			echo "chrt -b -p 0 ${pid[$i]}"
			chrt -b -p 0 ${pid[$i]}
		elif [[ $i == 4 ]]
		then
			echo "chrt -r -p 97 ${pid[$i]}"
			chrt -r -p 97 ${pid[$i]}
		elif [[ $i == 5 ]]
		then
			echo "chrt -b -p 0 ${pid[$i]}"
			chrt -b -p 0 ${pid[$i]}
		elif [[ $i == 6 ]]
		then
			echo "chrt -b -p 0 ${pid[$i]}"
			chrt -b -p 0 ${pid[$i]}
		elif [[ $i == 7 ]]
		then
			echo "chrt -b -p 0 ${pid[$i]}"
			chrt -b -p 0 ${pid[$i]}
		elif [[ $i == 8 ]]
		then
			echo "chrt -f -p 96 ${pid[$i]}"
			chrt -f -p 96 ${pid[$i]}
		elif [[ $i == 9 ]]
		then
			echo "chrt -r -p 97 ${pid[$i]}"
			chrt -r -p 97 ${pid[$i]}
		fi
	done
fi

if [ $1 -eq 2 ]; then
        echo "Executing test #2"
        echo "Setting priorities for 100 processes"

	pid=( $(pgrep -f user_process_generator) )
	len=$(( ${#pid[@]} - 1 ))

        for i in $( seq 0 $len )
        do
		if [[ $(( i % 2 )) == 0 ]];
		then
			echo "chrt -f -p 98 ${pid[$i]}"
			chrt -f -p 98 ${pid[$i]}
		else	
			echo "chrt -r -p 97 ${pid[$i]}"
			chrt -r -p 97 ${pid[$i]}
		fi
        done

fi

