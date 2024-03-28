#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGDIR=/home/centos/shell-script-logs
USERID=$(id -u)
LOGFILE=$LOGSDIR/$0-$DATE.log

if [ $USERID -ne 0 ]
then
echo "ERROR: Please run this script with root access"
fi

VALIDATE(){
if [ $1 -ne 0 ]
then
echo "$2 Installation is Failure"
else
echo "$2 Installation is Success"
fi 
}

for i in $@
do
yum list installed $i &>>$LOGFILE 
if [ $? -ne 0 ]
then
echo "$i is not installed, lets install it"
yum install $i -y &>>$LOGFILE
VALIDATE $? "$i"
else 
echo "$i is already installed"
fi
done

