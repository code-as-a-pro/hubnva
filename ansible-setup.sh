#!/bin/bash

# Update the package list
sudo apt-get update -y

# Install prerequisite packages
sudo apt-get install -y software-properties-common

# Add Ansible PPA (Personal Package Archive)
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt-get install -y ansible

# Verify Ansible installation
ansible --version
