#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log 

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE () {

if [ $1 -ne 0 ]
then
echo -e "The $2 .....$R FAILURE $N"
exit 1
else
echo -e "The $2 ...... $E SUCCESS $N"
fi 
}

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Please do installation with root user"
exit 1
else
echo "This is the root user"
fi

yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installing MYSQL"

yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installing postfix"

