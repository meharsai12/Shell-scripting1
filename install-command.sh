#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run the script with root access"
    exit 1

else
    echo "You have root access"

fi    

dnf install mysql -y

if [$? -ne 0 ]
then 
    echo "Then mysql is not installed going to install it"
    dnf install mysql -y
    if [$? -eq 0 ]
    then
        echo "Mysql installation is success"
    else
        echo "Mysql installation is failure"
        exit 1
    fi

else 
 echo "Mysql is already installed"

fi        

