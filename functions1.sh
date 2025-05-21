#!/bin/bash

USERID=$(id -u)


if [ $USERID -ne 0 ]
then
    echo " Error you dont have root access to run"
    exit 1

else
    echo " you have root access to run the command "

fi
  echo "You are running with root access"
i