#!/bin/bash

USERID=$(id -u)
 
R="\e[31m"   #colourcodes number 
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/Shellscripti-logs" #create a logs folder upon name Shellscripting-logs
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) #by using this command my file name logs.sh it wont be good to save logs in file logs.sh.logs ,Instead by using this command we cut first part so it will be logs.log
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("nginx" "mysql" "httpd")

mkdir -p $LOGS_FOLDER # by this we can create a directory and in that directory we can create a folder and by adding -p we can create multiple the output will be it is alread there , we cant see anything on scrre we need to check in logs folder
#| tee -a $LOG_FILE - It can show the out of something we added and stores in the log folder also
echo "Script started and executed at : : $(date)" # by adding this command we can add out at top of the output the the execution time 


 #&>>$LOG_FILE - by adding this at last of any line , It will store the logs in log file folder , Because for installating there will lot of logs in the output 


if [ $USERID -ne 0 ]

then

    echo -e  "$R ERROR::   Please run this script with root access $N"    # -e is to bee addded after echo to print colour statement
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access"
fi

# validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is ...$Y SUCCESS $N"
    else
        echo -e "Installing $2 is ... $Y FAILURE $N"
        exit 1
    fi
}
for package in ${PACKAGES[@]}
#for package in $@
do
    dnf list installed $package  | tee -a $LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e " $Y $package is not installed... going to install it $N" &>>$LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$Y $package is already installed...Nothing to do $Y"   | tee -a $LOG_FILE
    fi
done