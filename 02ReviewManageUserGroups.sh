
#!/usr/bin/env bash

# Run script as root 
# learner user account needs to be created


echo -e "\e[1;31m**Run as Root user**"

echo " "

echo -e "\e[1;93mManage Users and Groups Review Check \e[0m"   





echo " "

#Task 1 

task1path="/home/learner/teamdata"
task1cmd=$(sudo find /home/learner -iname teamdata -type d -perm 2770 -print -quit 2> /dev/null)



echo -e "\e[1;93mTask 1\e[0m"   

if [ "$task1path" == "$task1cmd" ];
then
	echo -e "\e[1;32m[Correct]\e[0m Successfully created the directory with correct permissions"
else
	echo -e "\e[1;31m[Incorrect]\e[0m Directory not found"
fi

users=("charles" "adam" "jasmine")

for user in "${users[@]}";
do
	if grep -ie "$user:" /etc/passwd &> /dev/null;
	
	then 
		echo -e "\e[1;32m[Correct]\e[0m User '$user' found"
	
	else 
		echo -e "\e[1;31m[Incorrect]\e[0m User '$user' not found"
	fi
done



#Task 2 -  

echo -e "\e[1;93mTask 2\e[0m"   

for user in "${users[@]}";
do
	if id "$user" | grep -w "sysadmins" &> /dev/null;
	then 
		echo -e "\e[1;32m[Correct]\e[0m User '$user' found in 'sysadmins' group"	
	else 
		echo -e "\e[1;31m[Incorrect]\e[0m User '$user' not found in 'sysadmins' group"	
	fi
done

getgid=$(getent group sysadmins | awk -F: '{print $3}')
taskgid="1550"


if [ "$getgid" == "$taskgid" ]; 
then 
	echo -e "\e[1;32m[Correct]\e[0m Gid of "sysadmins" is set to 1550"	
else
	echo -e "\e[1;31m[Correct]\e[0m Gid of "sysadmins" is not 1550"	
fi

#Task 3 

echo -e "\e[1;93mTask 3\e[0m"   

#Task 4 

echo -e "\e[1;93mTask 4\e[0m"   


#Task 5  


echo -e "\e[1;93mTask 5\e[0m"   


#Author: Jose N. Sosa
#Created: 03-14-2025
