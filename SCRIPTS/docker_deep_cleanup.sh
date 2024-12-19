#!/bin/bash

# Description: Cleanup script for Docker on Ubuntu
# Step 1: sudo chmod +x ./docker_deep_cleanup.sh
# Step 2: ./docker_deep_cleanup.sh

# Function to display a message (using echo directly)
echo "Starting Docker deep cleanup..."

# Stop containers
echo "Stopping containers..."
sudo docker stop $(sudo docker ps -q)

# Remove containers
echo "Removing containers..."
sudo docker rm $(sudo docker ps -a -q)

# Remove all stopped containers, all networks, anonymous volumes, build cache
echo "Running prune..."
sudo docker system prune -a --volumes

# Display total disk space reclaimed
echo "Calculating reclaimed disk space..."
docker system df

echo "Docker deep cleanup complete!"


