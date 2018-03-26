#!/bin/bash

#Taking input from the user. Will check if any EC2 instance is stopped from the last 'n' no of days
echo "Please enter the no of days"

read No_of_Days

#Storing curent date in YY-MM-DD format
CURRENT_DATE=`date +%Y-%m-%d`
#Subtarcting no of days from current date
FINAL_DATE=$(date --date="${CURRENT_DATE} -${No_of_Days} day" +%Y-%m-%d)

#Print EC2 instances with stopped state from last n no of days
echo "Below is the ec2 instances with stopped state from last ${No_of_Days} days : "
aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped" "Name=launch-time,Values=${FINAL_DATE}*" --query 'Reservations[].Instances[].[InstanceId,LaunchTime]' --output text
