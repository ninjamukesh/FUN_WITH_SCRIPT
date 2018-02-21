#!/bin/bash

echo "enter first number"
read first
echo "enter second number"
read sec


echo -e "Number entered by u are: $x and $y\n"

#function to add two numbers
add()
{
x=$1
y=$2
echo -e "sum of $1 and $2 is `expr $x + $y`"
}
#calling function
add $first $sec

#function to multiply two numbers

multi()
{
x=$1
y=$2
echo -e "multication of $1 and $2 is `expr $x \* $y`"
}
multi $first $sec

#function to sub two numbers

sub()
{
#x=$1
#y=$2
echo -e "substraction of $1 and $2 is `expr $first - $sec`"
}
sub $first $sec



div()
{
#x=$1
#y=$2
echo -e "Division of $1 and $2 is `expr $first / $sec`"
}
div $first $sec






