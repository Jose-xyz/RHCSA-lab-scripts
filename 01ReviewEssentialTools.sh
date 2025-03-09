#!/usr/bin/env bash

# Run script as root 
# learner user account needs to be created




echo -e "\e[1;93mStart of Essential Tools Review Check \e[0m"   


echo " "

#Task 1 

echo -e "\e[1;93mTask 1\e[0m"   

if [ -d /home/learner/reviewfolder ] &> /dev/null
then
	echo -e "\e[1;32m[Correct]\e[0m Successfully created the directory 'reviewfolder'"
else
	echo -e "\e[1;31m[Incorrect]\e[0m Directory not found"
fi

#Task 2 -  

echo -e "\e[1;93mTask 2\e[0m"   

lsetc=$( ls -a /etc )
etclistfile=$( cat /home/learner/reviewfolder/etclist.txt 2> /dev/null )

if [ "$lsetc" == "$etclistfile" ]; 
then
	echo -e "\e[1;32m[Correct]\e[0m File etclist.txt exists with correct content"
else
	echo -e "\e[1;31m[Incorrect]\e[0m Check location and contents of etclist.txt"
fi

#Task 3 

echo -e "\e[1;93mTask 3\e[0m"   

boottarsize="/home/learner/reviewfolder/boot.tar.gz"
bootdirsize="/boot"

tarsize=$(stat -c %s "$boottarsize" 2> /dev/null)
dirsize=$(du -sb "$bootdirsize" 2> /dev/null | awk '{print $1}')

if  find /home/learner/reviewfolder/ -iname boot.tar.gz -user root > /dev/null 2>&1 && [ -s /home/learner/reviewfolder/boot.tar.gz ] && (( tarsize < dirsize )); 
then
	echo -e "\e[1;32m[Correct]\e[0m Tar file exists with correct content"
else
	echo -e "\e[1;31m[Incorrect]\e[0m Check for correct syntax and file location"
fi

#Task 4 

echo -e "\e[1;93mTask 4\e[0m"   

if  [ -f /home/learner/reviewfolder/secret.txt ] 2> /dev/null && find /home/learner/reviewfolder/ -iname secret -type f -perm 600 2> /dev/null;  
then
	echo -e "\e[1;32m[Correct]\e[0m Secret.txt found with correct permissions"
else
	echo -e "\e[1;31m[Incorrect]\e[0m Check that file exists with correct permissions"
fi


#Task 5  

lsslink=$(ls /home/learner/Desktop/link2reviewfolder 2> /dev/null)
lsreviewfolder=$( ls /home/learner/reviewfolder/ 2> /dev/null)


echo -e "\e[1;93mTask 5\e[0m"   

if  [ -L /home/learner/Desktop/link2reviewfolder ] && [ "$lsslink" == "$lsreviewfolder" ]; 
then
	echo -e "\e[1;32m[Correct]\e[0m Link is a symbolic link"
else'{ print($1>100, $1>"100", $2>100, $2>"100") }'
	echo -e "\e[1;31m[Incorrect]\e[0m Link was not created"
fi

#Author: Jose N. Sosa
#Created: 02-02-2025
