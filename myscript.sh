
echo "Please enter the VPC ID"
read VPC_ID

# Store InstanceID in file
aws ec2 describe-instances --filters "Name=vpc-id,Values=${VPC_ID}" --query 'Reservations[*].Instances[*].InstanceId' --output text > /home/vagrant/instanceIDS.txt

# Store Instance's tags in a file
file="/home/vagrant/instanceIDS.txt"
no_of_instances=0
while IFS= read line
do
aws ec2 describe-tags --filters "Name=resource-id,Values=${line}" --query 'Tags[*].Value' --output text >> /home/vagrant/TAG.txt
no_of_instances=`expr ${no_of_instances} + 1 `
done <"$file"

#Create html report 

echo "<html> <table>  <tr> " > /home/vagrant/htmlreport.html
file="/home/vagrant/ColumnNames.txt"
no_of_column=0

# Create column names (reading column names from file)

while IFS= read line
do
echo "<th> "${line}" </th>"  >> /home/vagrant/htmlreport.html
no_of_column=` expr ${no_of_column} + 1 `
done <"$file"

echo "</tr>" >> /home/vagrant/htmlreport.html




#create rows functions
#InstanceID function

InstanceID_HTML()
{
Instance_no=$1
Column_no=1
echo "<tr>" >> /home/vagrant/htmlreport.html 
echo "<td>" >> /home/vagrant/htmlreport.html
awk "NR==$Instance_no {print \$1}" /home/vagrant/instanceIDS.txt >> /home/vagrant/htmlreport.html
echo "</td>" >> /home/vagrant/htmlreport.html

}


#TAG function
TAG_HTML()
{
Instance_no=$1

for (( j=1; j <= 2; j++ ))
do
echo "<td>" >> /home/vagrant/htmlreport.html 
awk "NR==$Instance_no {print \$($j)}" /home/vagrant/TAG.txt >> /home/vagrant/htmlreport.html
echo "</td>" >> /home/vagrant/htmlreport.html
done
echo $j
echo "</tr>" >> /home/vagrant/htmlreport.html

}


#Calling function
for (( i=1; i <= $no_of_instances; i++ ))
do
InstanceID_HTML $i
TAG_HTML $i
done
echo "</table> </html>" >> /home/vagrant/htmlreport.html
