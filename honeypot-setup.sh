#!/bin/bash
# Update package lists
apt-get update

# Install Cowrie honeypot
apt-get install -y git python3-venv python3-dev libssl-dev libffi-dev build-essential

# Clone the Cowrie repository
git clone https://github.com/cowrie/cowrie.git /opt/cowrie

# Set up the virtual environment
cd /opt/cowrie
python3 -m venv cowrie-env
source cowrie-env/bin/activate

# Install Cowrie dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Configure Cowrie
cp etc/cowrie.cfg.dist etc/cowrie.cfg

# Start Cowrie
bin/cowrie start
