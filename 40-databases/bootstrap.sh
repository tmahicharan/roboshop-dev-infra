#!/bin/bash
component=$1
dnf install ansible git -y
# ansible-pull -U https://github.com/tmahicharan/ansible-roboshop-roles-tf.git -e component=$component main.yaml

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
ansible-playbook -e component=$component main.yaml 