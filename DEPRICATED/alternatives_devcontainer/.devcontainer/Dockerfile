# Use the latest Ubuntu image from Docker Hub
FROM ubuntu:latest

# update packages and install python
RUN apt-get update \
    && apt-get install python3 -y \
    && apt-get install python3-venv -y

# Set Python 3 as the default python interpreter
RUN ln -s /usr/bin/python3 /usr/bin/python

# Verify installation
RUN python --version
#RUN pip --version

# (optional) Install usb utilites, to check for the USB connection
RUN apt-get install usbutils -y
# Run lsusb in the container to get list of USB connections
