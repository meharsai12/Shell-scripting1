#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run the script with root access"
    exit 1

else
    echo "You have root access"

fi    

dnf install sql -y

if [$? -ne 0 ] 
    echo "Then the sql is success"

 then 
    echo "Then the sql is not sucess"
    #exit 1

fi    

