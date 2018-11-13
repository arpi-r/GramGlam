#!/bin/bash
menu=1
opt=1
chmod +x ./newdoc.sh
chmod +x ./syncheck.bash
chmod +x ./suggest.sh
while [ $menu -eq 1 ]
do
	clear
	echo "        WELCOME TO GRAM-GLAM"
	echo "1.Create a new document"
	echo "2.Spell-Check"
	echo "3.Find Synonyms"	
	read opt
	case $opt in

	1)
	exec ./newdoc.sh $filename
	;;
	
	2)
	echo "Enter filename to be checked"
	read fil 
	bash suggest.sh $fil
	;;

	3)
	exec ./syncheck.bash
	
	;;
	
	*)
	echo "Invalid option"
	esac
	
	echo "Do you wish to enter again (yes=1/no=0): "
	read menu
	
done
 
