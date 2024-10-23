#!/bin/bash

# NB! Run this script outside the container/docker!

# This script removes our devcontainers, that starts with "mplab". It removes both containers and images, and added pruning docker system if needed.

# HOW-TO use:
# Change permission: chmod +x ./CLEAN.sh
# Execute: ./CLEAN.sh

# Function to stop and remove containers
remove_containers() {
    containers=$(docker ps -a --filter "name=mplab" --format "{{.ID}}")
    if [ -z "$containers" ]; then
        echo "No containers found starting with 'mplab'."
    else
        echo "Stopping and removing all our devcontainers starting with 'mplab'."
        for container in $containers; do
            echo "Stopping container: $container"
            docker stop $container
            echo "Removing container: $container"
            docker rm $container
        done
    fi
}

# Function to remove images
remove_images() {
    images=$(docker images --filter=reference='mplab*' --format "{{.ID}}")
    if [ -z "$images" ]; then
        echo "No images found starting with 'mplab'."
    else
        echo "Removing images starting with 'mplab'."
        for image in $images; do
            echo "Removing image: $image"
            docker rmi $image
        done
    fi
}

# Function to prune docker
prune_docker() {
    echo "Pruning Docker system..."
    docker system prune -a --volumes
}

# Execute the functions
remove_containers
remove_images
prune_docker

echo "Operation completed."