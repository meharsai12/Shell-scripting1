#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run the script with root access"
    exit 1

else
    echo "You have root access"

fi 

#below validation code is a function 
VALIDATE(){
    if ($1 -eq 0)
    then
        echo "$2 installation is sucess"
    else
        echo "$2 installation is failure"
        exit 1

    fi        
}
    dnf list installed mysql
     
    if ($? -ne 0)
    then    
        echo "Mysql is not installed going to install it "
        dnf install mysql -y
        VALIDATE $? "MySQL"
    else
        echo "mysql is already installed nothing to do "

    fi

    dnf list installed python-3 
    if ($? -ne 0)
    then    
        echo "python-3 is not installed going to install it "
        dnf install python-3 -y
        VALIDATE $? "PYTHON 3"
    else
        echo "python 3 is already installed nothing to do "

    fi

    dnf list installed nginx


    if ($? -ne 0)
    then    
        echo "nginx is not installed going to install it "
        dnf install ngnix -y
        VALIDATE $? "NGNIX"
    else
        echo "nginx is already installed nothing to do "

    fi