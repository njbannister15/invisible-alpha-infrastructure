#!/bin/bash
sudo apt-get update -y

# wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war

sudo apt-get install -y default-jdk
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins


sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce
sudo docker run hello-world
sudo usermod -aG docker $USER
sudo usermod -aG docker jenkins
sudo docker pull jenkins

sudo reboot
# Setup Jenkins as a daemon launched on start. See /etc/init.d/jenkins for more details.
# Create a jenkins user to run this service.
# Direct console log output to the file /var/log/jenkins/jenkins.log. Check this file if you are troubleshooting Jenkins.
# Populate /etc/default/jenkins with configuration parameters for the launch, e.g JENKINS_HOME
# Set Jenkins to listen on port 8080. Access this port with your browser to start configuration.