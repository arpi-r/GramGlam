menu=""
filename=""
clear
echo "Enter filename of new document"
read filename
tem=0
echo "Templates Available"
echo "1. Letter"
echo "2. Resume' "
echo "3. Notice"
echo "4. Blank Document"
echo "Enter template option: "
read tem

case $tem in

1)
cat letter.txt > $filename
gedit $filename
;;


2)
cat resume.txt > $filename
gedit $filename
;;


3)
cat notice.txt > $filename
gedit $filename
;;


4)
gedit $filename
;;


*)
echo "Invalid option"

esac

echo "Do you wish to enter again (yes=1/no=0): "
read menu
if [ $menu -eq 1 ]
then 
	exec ./master.sh
fi

