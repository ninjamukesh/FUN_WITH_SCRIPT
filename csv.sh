#!/bin/bash

git_url=$1
#log_no=$2

cd /root/test_kavit/

git clone $git_url

dir=`ls`

cd /root/test_kavit/$dir

#`git log -n1 --pretty=format:"%an,%ae committed %h on %cd" > /root/kavit_scripts/csv.txt` 

git log -n1 > /root/gitlog_backup/"$(date +"%Y_%m_%d_%I_%M_%p").log"

#touch /root/gitlog_backup/"$(date +"%Y_%m_%d_%I_%M_%p").log"
