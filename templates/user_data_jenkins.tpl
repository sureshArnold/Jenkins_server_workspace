#!/bin/bash

set -e

# Update system
dnf update -y

# Install required packages
dnf install -y wget java-17-openjdk

# Verify Java
java -version

# Add Jenkins repository
wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import Jenkins repository key
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2026.key

# Install Jenkins
dnf install -y jenkins

# Start Jenkins
systemctl enable jenkins
systemctl start jenkins

# Allow Jenkins through RHEL firewall
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --reload