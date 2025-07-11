#!/bin/bash

USERID=$(id -u)
 
R="\e[31m"   #colourcodes number 
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]

then

    echo -e  "$R ERROR::   Please run this script with root access $N"   # -e is to bee addded after echo to print colour statement
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
    echo -e " $Y MySQL is not installed... going to install it $N"
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e "$Y MySQL is already installed...Nothing to do $Y"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e  " $Y python3 is already installed...Nothing to do $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo  -e " $Y nginx is already installed...Nothing to do $N"
fi