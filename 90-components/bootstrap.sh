#!/bin/bash
component=$1
env=$2
dnf install ansible git -y

REPO_URL="https://github.com/tmahicharan/ansible-roboshop-roles-tf.git"
REPO_DIR="/opt/roboshop/ansible"
ANSIBLE_DIR="ansible-roboshop-roles-tf"

mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop
touch /var/log/roboshop/ansible.log

cd $REPO_DIR

#check id ansible repo is already cloned or not
if [ -d "$ANSIBLE_DIR" ]; then
    echo "Ansible repo already cloned. Pulling latest changes..."
        cd $ANSIBLE_DIR
        git pull origin main
    else
        echo "Cloning Ansible repo..."
        git clone $REPO_URL
        cd $ANSIBLE_DIR
fi
ansible-playbook -i inventory.ini -e component=$component -e env=$env main.yaml 