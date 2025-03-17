
#!/usr/bin/env bash

# Run script as root 
# learner user account needs to be created


echo -e "\e[1;91m**Run as Root user**"

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
taskgid=1550


if [ "$getgid" == "$taskgid" ]; 
then 
	echo -e "\e[1;32m[Correct]\e[0m Gid of "sysadmins" is set to 1550"	
else
	echo -e "\e[1;31m[Incorrect]\e[0m Gid of "sysadmins" is not 1550"	
fi

#Task 3 

echo -e "\e[1;93mTask 3\e[0m"   

task3cmd=$(sudo chage -l jasmine | grep -i max | awk '{ print $9 }')
task3goal=90


if [ "$task3cmd" == "$task3goal" ]; 
then 
	echo -e "\e[1;32m[Correct]\e[0m Jasmine's max password age is 90 days"	
else
	echo -e "\e[1;31m[Incorrect]\e[0m Jasmine's max password age is NOT 90 days"
fi


#Task 4 

echo -e "\e[1;93mTask 4\e[0m"   

task04grep1=$(sudo grep ^%sysadmins /etc/sudoers | awk '{ print $1}')
task04grep2=$(sudo grep ^%sysadmins /etc/sudoers | awk '{ print $2}')
task04grep3=$(sudo grep ^%sysadmins /etc/sudoers | awk '{ print $3}')


task04p1="%sysadmins"	
task04p2="ALL=(ALL)"	
task04p3="NOPASSWD:"

if [[ "$task04grep1" == "$task04p1" && "$task04grep2" == "$task04p2" && "$task04grep3" == "$task04p3" ]]; 
then 
	echo -e "\e[1;32m[Correct]\e[0m Sysadmins group super access configured"	
else
	echo -e "\e[1;31m[Incorrect]\e[0m Sysadmins group super access NOT configured"
fi

#Task 5  


echo -e "\e[1;93mTask 5\e[0m"   

task05cmd=$(grep PASS_MIN_DAYS /etc/login.defs | awk  'NR == 2 { print $2; exit}')
taskgoal=30

if [ "$task05cmd" == "$taskgoal" ]; 
then 
	echo -e "\e[1;32m[Correct]\e[0m Password minimum age configured"	
else
	echo -e "\e[1;31m[Incorrect]\e[0m Password minimum age is not 30 days!"
fi



#Author: Jose N. Sosa
#Created: 03-14-2025
