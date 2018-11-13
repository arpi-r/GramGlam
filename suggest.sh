#!/bin/sh

if [ "$#" -ne 1 ]
then
	echo "Usage: bash suggest.sh <filename>"
	exit
fi

if [ -f "$1" ]
	then 
		:
else
	echo "Invalid filename"
	exit
fi

rm temp

echo "Suggested words to correct: "
j=0
for word in $(<"$1")
do
    if grep -iw "$word" dict > /dev/null
    	then
    		:
    elif echo "$word" | grep [^a-zA-Z] > /dev/null
    	then
    		:

    else
	touch temp
	rm temp
    	j=`expr "$j+1" | bc`
    	echo "Suggested error $j) $word : "
    	i=0
    	count=0
    	for((i=0;i<${#word};i++))
    	do
    		tmp1=${word:0:$i}
    		k=`expr "$i+1" | bc`
    		tmp2=${word:$k}
    		x="$tmp1.$tmp2"
    		
    		if grep -iw "$x" dict > /dev/null
    		then
    			grep -iw "$x" dict | sort -u 
    			grep -iw "$x" dict | sort -u >> temp
    			count=`expr "$count+1" | bc `
    		fi
    	done
    	#echo "$count"
    	if [ "$count" -eq 0 ]
    	then
    		echo "No suggestions found"
    	fi
    	echo ""
		echo "Choose:"
		echo "1)Replace with suggested word"
		echo "2)Replace with another word"
		echo "3)Add word to dictionary"
		echo "4)Ignore"
		read n
		case "$n" in 
			1)	echo  "Enter the line of suggested word: "
				read x
				y=`head -n $x temp | tail -1`
				sed -i "s/$word/$y/g" "$1"
				echo "word replaced."
				;;
			2)	echo -n "Enter word to replace it with: "
				read z
				sed -i "s/$word/$z/g" "$1"
				echo "word replaced."
				;;
			3)	echo "$word" >> dict
				echo "word added to dictionary."
				;;
			4)	echo "Ignored."
				;;
		esac
		
		echo ""
    fi
done
echo "No more suggestions in this run."


echo "Do you wish to enter again (yes=1/no=0): "
read menu
if [ $menu -eq 1 ]
then 
	exec ./master.sh
fi
