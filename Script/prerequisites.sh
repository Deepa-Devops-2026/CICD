#!/bin/bash

# ---------------------------------------------------------
# CI/CD Project - Prerequisites Installation Script
# Author:Deepa 
# Purpose: Install the tools required for the project
# ---------------------------------------------------------

echo "Updating package list..."
sudo apt update

echo "Upgrading installed packages..."
sudo apt upgrade -y

echo "Installing Git..."
sudo apt install -y git

echo "Installing Java (OpenJDK 21)..."
sudo apt install -y openjdk-21-jdk

echo "Installing Maven..."
sudo apt install -y maven

echo "Installing Ansible..."
sudo apt install -y ansible

echo "Installing Curl..."
sudo apt install -y curl

echo "Installing Unzip..."
sudo apt install -y unzip

echo "Installing Tree..."
sudo apt install -y tree

echo "Installing OpenSSH Client..."
sudo apt install -y openssh-client

echo
echo "--------------------------------------"
echo "Installed Versions"
echo "--------------------------------------"

echo
git --version

echo
java -version

echo
mvn -version

echo
ansible --version

echo
ssh -V

echo
echo "Prerequisites installation completed successfully."
