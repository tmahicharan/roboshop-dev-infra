#!/bin/bash
#growing the home/volume for terraform purpose
sudo growpart /dev/nvme0n1 4
sudo lvextend -L +30G /dev/mapper/RootVG-homevol
sudo xfs_growfs /home

# Terraform installation
sudo yum install -y yum-utils

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

sudo yum install -y terraform

# Running databases

cd /home/ec2-user
git clone https://github.com/tmahicharan/roboshop-dev-infra.git
cd roboshop-dev-infra/40-databases
terraform init
terraform apply -auto-approve