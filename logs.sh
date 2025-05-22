#!/bin/bash

USERID=$(id -u)
 
R="\e[31m"   #colourcodes number 
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/Shellscripti-logs" #create a logs folder upon name Shellscripting-logs
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) #by using this command my file name logs.sh it wont be good to save logs in file logs.sh.logs ,Instead by using this command we cut first part so it will be logs.log
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER # by this we can create a directory and in that directory we can create a folder and by adding -p we can create multiple the output will be it is alread there
echo "Script started and executed at : : $(date)" # by adding this command we can add out at top of the output the the execution time 


 #&>>$LOG_FILE - by adding this at last of any line , It will store the logs in log file folder , Because for installating there will lot of logs in the output 


if [ $USERID -ne 0 ]

then

    echo -e  "$R ERROR::   Please run this script with root access $N"  &>>$LOG_FILE  # -e is to bee addded after echo to print colour statement
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

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e " $Y MySQL is not installed... going to install it $N" &>>$LOG_FILE
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e "$Y MySQL is already installed...Nothing to do $Y"   &>>$LOG_FILE
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it"      &>>$LOG_FILE
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e  " $Y python3 is already installed...Nothing to do $N"  &>>$LOG_FILE
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"      &>>$LOG_FILE
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo  -e " $Y nginx is already installed...Nothing to do $N"  &>>$LOG_FILE
fi