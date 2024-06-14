# Use the latest Ubuntu image from Docker Hub
FROM ubuntu:latest

# update packages and install python
RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install usbutils -y
# Run lsusb in the container to get list of USB connections

RUN mkdir workspace
WORKDIR /workspace
