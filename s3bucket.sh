#!/bin/bash
yum install epel-release -y
yum install python-pip -y
pip install awscli
aws --version
awscli configure

echo Enter the value of  access key
read ACCESS_KEY
echo Enter the value of security key
read SECURITY_KEY
echo Enter the value of zone
read ZONE

export AWS_ACCESS_KEY_ID=$ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=$SECURITY_KEY
export AWS_DEFAULT_REGION=$ZONE

echo -e  "\n\nbucket name are :-"
aws s3 ls | awk '{print $3}' $@

echo -e "Creation date of the bucket"
aws s3 ls | awk '{print $3 "  "$1}'

s3=$(aws s3 ls | awk '{print $3}' $@)

echo "Number of files"
for i in $s3; do echo -e "\n\n${i}"; aws s3 ls s3://$i; done

