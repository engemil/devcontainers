# Use the (latest) Ubuntu image from Docker Hub
FROM ubuntu:noble

# Note 1: The source of this code is https://askubuntu.com/questions/1243252/how-to-install-arm-none-eabi-gdb-on-ubuntu-20-04-lts-focal-fossa
# Note 2: If you are not running as root user, remember to utilize "sudo" infront of each command

# Update and upgrade packages
RUN apt-get update \
    && apt-get upgrade -y
# git - For getting repositories. https://packages.ubuntu.com/noble/git
RUN apt-get install git -y
# wget - For downloading files. https://packages.ubuntu.com/noble/wget
RUN apt-get install wget -y 
# xz-utils - For unzipping folders. https://packages.ubuntu.com/noble/xz-utils
RUN apt-get install xz-utils -y 
# build-essential - Includes dpkg-dev, g++, gcc, libc6-dev, make. https://packages.ubuntu.com/noble/build-essential
RUN apt-get install build-essential -y 
# gcc-arm-none-eabi - Arm GNU Toolchain. Includes libnewlib aswell. https://packages.ubuntu.com/noble/gcc-arm-none-eabi
RUN apt-get install gcc-arm-none-eabi -y
# usbutils - To check for the USB connection (Run: lsusb). https://packages.ubuntu.com/noble/usbutils
RUN apt-get install usbutils -y 
# openocd - Open On-chip Debugger. https://packages.ubuntu.com/noble/openocd
RUN apt-get install openocd -y
# gdb - GNU project Debugger. https://packages.ubuntu.com/noble/gdb
RUN apt-get install gdb -y

# Expose ports for OpenOCD and GDB
# GDB Server Port
EXPOSE 3333
# Telnet Server Port
EXPOSE 4444
# TCL Server Port
EXPOSE 6666


RUN mkdir workspace
WORKDIR /workspace



