#Yen Pham
#Minor Project 1
#!/bin/bash

trap 'sigint' 2

sigint ()
{
        echo "(SIGINT) ignored. Enter ^C 1 more time to terminate program."
        trap 2
        sleep 2s
}

if [ -z $@ ] #check empty string 
then
	echo "Memory Usage % parameter not specified. Aborting..."
	exit

elif ! [[ "$1" =~ ^[0-9]+$ ]] #check if input is an integer or not
then
	echo "Memory Usage parameter is not a valid integer percentage value between 1 and 99. Aborting..."
	exit

elif [ $@ -ge 1 -a $@ -le 99 ] #check if input is within the given range from 1 to 99
then
	while [ 1 ] #run loops
	do
		memory_usage=$(ps -o pid,user,%mem ax | grep -v PID | sort -k3 -r | awk '/[0-9]*/{print $1":"$2":"$3}') #read info
		echo `date`
		echo "Processes occupying $@% or more system memory:"

		for i in $memory_usage
		do
			PID=$(echo $i | cut -d: -f1) 
			USER=$(echo $i | cut -d: -f2)
			MEMORY=$(echo $i | cut -d: -f3)	

			if (( $(echo "$MEMORY >= $@" | bc -l) ))
			then
				echo "$PID $USER $MEMORY%"
			fi
		done
		sleep 10s
	done
else
	echo "Memory Usage parameter is not a valid integer percentage value between 1 and 99. Aborting..."
	exit
fi

