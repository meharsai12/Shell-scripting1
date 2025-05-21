#!/bin/bash

TIMESTAMP=$(date)
echo "Script executed at $TIMESTAMP "
USERID=$(id -u)


if [ $USERID -ne 0 ]
then
    echo " Error you dont have root access to run"
    exit 1

else
    echo " you have root access to run the command "

fi
  echo "You are running with root access"


dnf list installed mysql -y

if [ $? -ne 0 ]
then
    echo " Mysql is not installed in your server going to install it"
    dnf install mysql -y 
    if [ $? -eq 0 ]
    then 
        echo "Mysql is  installation is success "
    else
        echo "Mysql is installation is failure "
        exit 1
    fi
    
else
    echo " mysql is already installed "

fi


dnf list installed nginx -y
if [ $? -ne 0 ]
then
    echo " NGINX is not installed going to install it "
    dnf install nginx -y
    if [ $? -eq 0 ]
    then
        echo " NGINX installation is sucess "
    else
        echo "NGINX installation is failure"
        exit 1
    fi
else
    echo "NGINX IS already installed NOthing to do"
fi

dnf list installed mongodb -y
if [ $? -ne 0 ]
then
    echo " MONGODB is not installed going to install it "
    dnf install mongodb -y
    if [ $? -eq 0 ]
    then
        echo " mongodb installation is sucess "
    else
        echo " mongodb installation is failure "
    fi
else
    echo "mongodb is already installed "
fi