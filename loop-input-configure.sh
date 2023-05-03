#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Prompt for package selection
echo "Which packages would you like to install?"
echo "1. Git"
echo "2. Maven"
echo "3. OpenJDK 11"
echo "4. Docker"
echo "5. Docker Compose"
echo "6. Ansible"
echo "7. Terraform"
echo "8. Nginx"

read -p "Enter a comma-separated list of package numbers to install (e.g. 1,3,5): " choices

# Install selected packages
for choice in $(echo $choices | tr ',' ' ')
do
  case $choice in
    1)
      if [ -x "$(command -v git)" ]; then
        echo "Git already installed"
      else
        apt-get -y install git
        echo "Git installed"
      fi
      ;;
    2)
      if [ -x "$(command -v mvn)" ]; then
        echo "Maven already installed"
      else
        apt-get -y install maven
        echo "Maven installed"
      fi
      ;;
    3)
      if [ -x "$(command -v java)" ] && [[ "$(java -version 2>&1)" == *"11"* ]]; then
        echo "OpenJDK 11 already installed"
      else
        apt-get -y install openjdk-11-jdk
        echo "OpenJDK 11 installed"
      fi
      ;;
    4)
      if [ -x "$(command -v docker)" ]; then
        echo "Docker already installed"
      else
        apt-get -y install docker-ce docker-ce-cli containerd.io
        echo "Docker installed"
        systemctl start docker
        systemctl enable docker
      fi
      ;;
    5)
      if [ -x "$(command -v docker-compose)" ]; then
        echo "Docker Compose already installed"
      else
        apt-get -y install docker-compose
        echo "Docker Compose installed"
      fi
      ;;
    6)
      if [ -x "$(command -v ansible)" ]; then
        echo "Ansible already installed"
      else
        apt-get -y install ansible
        echo "Ansible installed"
      fi
      ;;
    7)
      if [ -x "$(command -v terraform)" ]; then
        echo "Terraform already installed"
      else
        apt-get -y install terraform
        echo "Terraform installed"
      fi
      ;;
    8)
      if [ -x "$(command -v nginx)" ]; then
        echo "Nginx already installed"
      else
        apt-get -y install nginx
        echo "Nginx installed"
      fi
      ;;
    *)
      echo "Invalid selection: $choice"
      ;;
  esac
done
