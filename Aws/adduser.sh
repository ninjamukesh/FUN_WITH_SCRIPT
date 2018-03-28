#!/bin/bash

#creating a variable for group name
group_name=ninja
#cli for creating group name and attaching policy
aws iam create-group --group-name $group_name
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess --group-name $group_name

#creating variable for file containing users
Add_User=users.txt

#while loop will read line by line and will add it to the group and read next line
while IFS= read line
do
    aws iam create-user --user-name $line 

   aws iam add-user-to-group --user-name $line  --group-name $group_name
done < $Add_User


