#!/bin/bash


TIMESTAMP=$(date)
echo "script executed at $TIMESTAMP"


USERID=$(id -u)

if [ $? -ne 0 ]
then
    echo " you dont have root access"
    exit 1
else
    echo "you have root access"
fi