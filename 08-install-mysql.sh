#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "Please do installation with root user"
exit 1
else
echo "This is the root user"
fi

yum install mysql -y

if [ $? -ne 0 ]

then
echo "The mysql installation is not successfull"

else

echo "The installation of mysql is successfull"

yum install postfix -y

if [ $? -ne 0 ]

then
echo "The postfix installation is not successfull"

else

echo "The installation of postfix is successfull"

