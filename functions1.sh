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
