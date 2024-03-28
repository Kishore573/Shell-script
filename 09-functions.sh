#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "Please do installation with root user"
exit 1
else
echo "This is the root user"
fi

VALIDATE () {

if [ $1 -ne 0 ]
then
echo "The $2 installation is not successfull"
exit 1
else
echo "The $2 installation is successfull"
fi 
}

yum install mysql -y

VALIDATE $? 

yum install postfix -y

VALIDATE $?

