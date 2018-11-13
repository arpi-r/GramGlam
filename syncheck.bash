#!/bin/bash
echo "Synonym Checker"
echo "Enter the word for which you want the synonym: "
read word 
echo "Synonyms of the given word are:"
grep -i "$word" synonyms | sed "s/, /\n/g" >tempsyn
grep -i "$word" synonyms | sed "s/, /\n/g" | cat -n 
echo "Do you want to replace the word with one of the synonyms :"
echo "Enter Yes or No :"
read op
if [ $op = "Yes" ]
then
	echo "Select the Synonym , enter synonym number"
	read num 
	echo "Enter file name "
	read file 
	val=`head -n $num tempsyn | tail -n 1`
	#echo $val
	sed -i "s/$word/$val/g" $file 
	echo "Done!"
fi
