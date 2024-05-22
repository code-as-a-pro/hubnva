#!/bin/bash
# Update package lists
apt-get update

# Install necessary dependencies
apt-get install -y git

# Clone the pfSense repository (Note: Adjust the repository URL if necessary)
git clone https://github.com/pfsense/pfsense.git /opt/pfsense

# Navigate to the pfSense directory and run the setup script
cd /opt/pfsense
./setup.sh

# Enable and start the pfSense service
systemctl enable pfsense
systemctl start pfsense
