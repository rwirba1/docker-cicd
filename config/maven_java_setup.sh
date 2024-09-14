#!/bin/bash

# Change the hostname to ezlearn-slave-node
NEW_HOSTNAME="ezlearn-slave-node"
sudo hostname $NEW_HOSTNAME

# Update /etc/hosts to reflect the new hostname
echo "127.0.1.1 $NEW_HOSTNAME" | sudo tee -a /etc/hosts

# Define the Maven download URL
MAVEN_DOWNLOAD_URL="https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz"

# Define the installation directory for Maven
M2_HOME="/opt/maven"

# Download Maven
wget $MAVEN_DOWNLOAD_URL -O /tmp/apache-maven-3.9.9-bin.tar.gz

# Extract the downloaded tarball
sudo tar -xzf /tmp/apache-maven-3.9.9-bin.tar.gz -C /opt

# Rename the extracted directory to 'maven'
sudo mv /opt/apache-maven-3.9.9 $M2_HOME

# Clean up the tar.gz file
rm /tmp/apache-maven-3.9.9-bin.tar.gz

# Add M2_HOME to /etc/profile and update the PATH for Maven
echo "Setting up Maven environment variables..."
echo "export M2_HOME=$M2_HOME" | sudo tee -a /etc/profile
echo "export PATH=\$M2_HOME/bin:\$PATH" | sudo tee -a /etc/profile

# Source the updated profile
source /etc/profile

# Update the package index
sudo apt-get update

# Install OpenJDK 17
sudo apt-get install -y openjdk-17-jdk=17.0.12+7-1ubuntu2~24.04


# Define the Java installation directory for OpenJDK 17.0.12
JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"

# Add JAVA_HOME to /etc/profile and update the PATH for Java
echo "export JAVA_HOME=$JAVA_HOME" | sudo tee -a /etc/profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" | sudo tee -a /etc/profile

# Source the updated profile again
source /etc/profile

# Install the software-properties-common package (required to add new repositories)
sudo apt-get install -y software-properties-common

# Add the Ansible PPA repository
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt-get install -y ansible

# Generate SSH keys using the ed25519 algorithm
echo "Generating SSH keys using ed25519 algorithm..."
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""

