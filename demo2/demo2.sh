#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "      $0 1"
    echo "              or"
    echo "      $0 2"
    exit
fi

gcc cse330_process.c -o cse330_process
killall cse330_process
dmesg -C

if [ $1 -eq 1 ]; then
        echo "Executing test #1"
        echo "Spawning 10 processes"

        for i in {1..10}
        do
                ( ./cse330_process &)
        done

        pid=( $(pgrep -f cse330_process) )
        len=$(( ${#pid[@]} - 1 ))

        for i in $( seq 0 $len )
        do
		if [[ $(( i % 2 )) == 0 ]];
		then
			echo "chrt -f -p 10 ${pid[$i]}"
			chrt -f -p 10 ${pid[$i]}
		else	
			echo "chrt -r -p 11 ${pid[$i]}"
			chrt -r -p 11 ${pid[$i]}
		fi
        done

	sleep 1.5
	killall cse330_process
	sleep 1
	echo For FF && for i in {88..89}; do dmesg | grep $i | grep FF  | uniq; done && echo For RR && for i in {88..89}; do dmesg | grep $i | grep RR | uniq; done
fi

if [ $1 -eq 2 ]; then
        echo "Executing test #2"
        echo "Spawning 100 processes"
        
	for j in {1..10}
	do
		for k in {1..10}
		do
			./cse330_process &
		done

		pid=( $(pgrep -f cse330_process) )
		len=$(( ${#pid[@]} - 1 ))
		#echo $len

		for i in $( seq 0 $len)
		do
			if [[ $(( i % 2 )) == 0 ]];
			then 
				echo "In FIFO"
				echo "chrt -f -p $j ${pid[$i]}"
				chrt -f -p $j ${pid[$i]}
			else	
				echo "In RR"
				echo "chrt -r -p $j ${pid[$i]}"
				chrt -r -p $j ${pid[$i]}
			fi
		done

		sleep 1.5
		killall cse330_process
	done
	for i in {89..99}; do dmesg | grep $i | grep 'FF\|RR'  | uniq; done
fi
