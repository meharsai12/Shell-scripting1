#!/bin/bash


TIMESTAMP=$(date)
echo "script executed at $TIMESTAMP"


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo " you dont have root access"
    exit 1
else
    echo "you have root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo " Installing $2 is success"
    else
        echo " Installing $2 is failed"
        exit 1
    fi
}


dnf list installed  nginx

if [ $? -ne 0 ]
then
    echo " nginx is not installed going to install "
    dnf install nginx
    VALIDATE $? "nginx"

else
    echo "nginx is already installed nothing to do..."
fi

dnf list installed nodejs

if [ $? -ne 0 ]
then
    echo "node js is not installed going to install
    dnf install nodejs -y
    VALIDATE $? "nodejs"

else
    echo "MySQL is already installed...Nothing to do"
fi



