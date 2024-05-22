#!/bin/bash

# Update the package list
sudo apt-get update -y

# Install dependencies for Dionaea
sudo apt-get install -y git autoconf build-essential libtool libssl-dev libffi-dev python3-dev python3-pip

# Install Dionaea
cd /opt
sudo git clone https://github.com/DinoTools/dionaea.git
cd dionaea
sudo ./autogen.sh
sudo ./configure --with-python=/usr/bin/python3 --with-ev=/usr/local
sudo make
sudo make install

# Create Dionaea configuration
sudo mkdir -p /opt/dionaea/var/dionaea/
sudo cp /opt/dionaea/etc/dionaea/dionaea.conf /opt/dionaea/var/dionaea/dionaea.conf

# Install Cowrie
sudo apt-get install -y python-virtualenv
cd /opt
sudo git clone https://github.com/cowrie/cowrie.git
cd cowrie
sudo virtualenv cowrie-env
source cowrie-env/bin/activate
sudo pip install -r requirements.txt

# Create Cowrie configuration
sudo cp cowrie.cfg.dist cowrie.cfg

# Enable Cowrie to start on boot
sudo cp /opt/cowrie/bin/cowrie /etc/init.d/cowrie
sudo update-rc.d cowrie defaults

# Start Cowrie
sudo service cowrie start

echo "Honeypot setup completed!"
