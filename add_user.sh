#!/bin/bash

echo "Please enter your name "

read username

while [ -z $username ]
do
if [ -z $username ]
then
echo "Please enter your name "
read username
fi
done 

echo "$username" >> username.txt

path=/root/opstree_scripts/username.txt

while read line;
do
useradd $line
done < $path
 
