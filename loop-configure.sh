#!/bin/bash

# Check if script is being run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Define a list of tools to be installed
tools=("git" "maven" "openjdk-11-jdk" "docker-ce" "docker-compose" "ansible" "terraform" "nginx")

# Update and upgrade packages
sudo apt-get update
sudo apt-get upgrade -y

# Clean package cache
sudo apt-get autoclean
sudo apt-get autoremove -y

# Loop through the list of tools
for tool in "${tools[@]}"
do
  # Check if the tool is already installed
  if ! command -v "$tool" &> /dev/null
  then
    # Install the tool using the appropriate package manager
    if [[ "$tool" == "docker-ce" ]]
    then
      sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
      echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
      sudo apt-get update
      sudo apt-get install -y docker-ce docker-ce-cli containerd.io
      sudo systemctl start docker
      sudo systemctl enable docker
    else
      sudo apt-get install -y "$tool"
    fi
  fi
done

# Install Nginx
if ! command -v "nginx" &> /dev/null
then
  sudo apt-get install -y nginx
fi

# Restart Nginx
sudo systemctl restart nginx
