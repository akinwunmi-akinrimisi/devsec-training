#!/bin/bash
set -e

# Become root
sudo su

# Update and install dependencies
apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common unzip

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
apt-get update
apt-get install -y docker-ce

# Add 'ubuntu' user to the docker group
usermod -aG docker ubuntu
chmod 666 /var/run/docker.sock

#install sonarscanner

wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip
unzip sonar-scanner-cli-5.0.1.3006-linux.zip
sudo mv sonar-scanner-5.0.1.3006-linux /opt/sonar-scanner
sudo ln -sf /opt/sonar-scanner/bin/sonar-scanner /usr/bin/sonar-scanner

