# Use the latest Ubuntu image from Docker Hub
FROM ubuntu:latest

# update packages and install python
RUN apt-get update \
    && apt-get install git -y \
    && apt-get install build-essential -y \
    && apt-get install libgl-dev -y \
    && apt-get install libxcb-xinerama0 -y \
    && apt-get install wget -y \
    && apt-get install python3 -y

# Set Python 3 as the default python interpreter
RUN ln -s /usr/bin/python3 /usr/bin/python

# Set the working directory
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/vedderb/bldc.git

# Change directory to the repository folder
WORKDIR /app/bldc

# Run make arm_sdk_install command
RUN make arm_sdk_install

# (Optional) Add udev rules to use the stlink v2 programmer without being root
# If you are running as non-root, then you should install sudo ad use it for all the other commands aswell
#RUN sudo wget vedder.se/Temp/49-stlinkv2.rules
#RUN sudo mv 49-stlinkv2.rules /etc/udev/rules.d/
#RUN sudo udevadm trigger


# (optional) Install usb utilites, to check for the USB connection
# RUN apt-get install usbutils -y
# Run lsusb in the container to get list of USB connections

# Command to run when the container starts
#CMD ["/bin/bash"]


