#Yen Pham
#!bin/bash

convert()
{
	input=$1
	if [ -z $input ]
	then 
		echo "Program needs one or more whole numbers [1 or greater]"
		exit
	fi

	case $input in
		`echo "$input" | grep "KB"`)
			argument=`echo $input | tr -cd [0-9]`
			argument=`echo "$argument*1024" | bc `
			echo "$input is $argument"
		;;

		`echo "$input" | grep "MB"`)
			argument=`echo $input | tr -cd [0-9]`
			argument=`echo "$argument*1024*1024" | bc `
			echo "$input is $argument"
		;;

		`echo "$input" | grep "GB"`)
			argument=`echo $input | tr -cd [0-9]`
			argument=`echo "$argument*1024*1024*1024" | bc `
			echo "$input is $argument"
		;;

		`echo "$input" | grep "B"`)
			argument=`echo $input | tr -cd [0-9]`
			echo "$input is $argument"
		;;
	esac
}

convert $1

	

