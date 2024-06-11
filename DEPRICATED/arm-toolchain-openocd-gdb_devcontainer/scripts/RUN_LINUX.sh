#!/bin/bash

# To run this script:
# step 1, give permission: chmod +x RUN_LINUX.sh
# step 2, run it: ./RUN_LINUX.sh

# Update package list and install required packages
echo "================================================================================"
echo "Updating package list and installing required packages..."
echo "================================================================================"
echo " " 
sudo apt-get update
sudo apt-get install -y ca-certificates curl

# Add Docker's official GPG key
echo " "
echo "================================================================================"
echo "Adding Docker's official GPG key..."
echo "================================================================================"
echo " "
echo "Adding GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the Docker repository to Apt sources
echo " "
echo "================================================================================"
echo "Adding Docker repository to Apt sources..."
echo "================================================================================"
echo " "
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install Docker packages
echo " "
echo "================================================================================"
echo "Installing Docker packages..."
echo "================================================================================"
echo " "
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add the current user to the docker group
echo " "
echo "================================================================================"
echo "Adding the current user to the docker group..."
echo "================================================================================"
echo " "
echo "running sudo usermod -aG docker $(whoami)..."
sudo usermod -aG docker $(whoami)

# Prompt for setting up a rule exception
echo " "
echo "================================================================================"
read -p "Do you want to set up a rule exception for USB devices? (y/n): " setup_rule
echo "================================================================================"
echo " "

if [[ $setup_rule == "y" || $setup_rule == "Y" || $setup_rule == "Yes" || $setup_rule == "yes" || $setup_rule == "YES" ]]; then
    echo "Not yet implemented, work-in-progress"
    # TODO: use lsusb to check for usb devices
    # TODO: give options for which ones to add (as done for the windows scripts)
#  echo "Setting up rule exception for USB devices..."
#  sudo bash -c 'echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0483\", ATTRS{idProduct}==\"374b\", MODE:=\"0666\"" > /etc/udev/rules.d/docker-usb.rules'
#  sudo udevadm control --reload-rules
#  sudo udevadm trigger
fi

# Recommend restarting the computer
echo "================================================================================"
echo "Docker installation is complete."
echo "It is recommended to restart your computer to apply all changes."
echo "================================================================================"
echo 
