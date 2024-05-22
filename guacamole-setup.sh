#!/bin/bash
# Update package lists
apt-get update

# Install necessary dependencies
apt-get install -y wget gcc libcairo2-dev libjpeg-turbo8-dev libpng-dev libtool-bin freerdp2-dev libssh2-1-dev libtelnet-dev libvncserver-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev

# Download Guacamole server
wget https://apache.org/dyn/closer.lua/guacamole/1.3.0/source/guacamole-server-1.3.0.tar.gz

# Extract the downloaded file
tar -xzf guacamole-server-1.3.0.tar.gz
cd guacamole-server-1.3.0

# Build and install Guacamole server
./configure --with-init-dir=/etc/init.d
make
make install
ldconfig

# Start Guacamole server
systemctl enable guacd
systemctl start guacd

# Download and setup Guacamole client
wget https://apache.org/dyn/closer.lua/guacamole/1.3.0/binary/guacamole-1.3.0.war -O /var/lib/tomcat9/webapps/guacamole.war

# Restart Tomcat service
systemctl restart tomcat9
