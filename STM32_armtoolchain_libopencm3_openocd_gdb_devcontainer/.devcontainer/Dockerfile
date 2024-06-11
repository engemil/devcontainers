# Use the (latest) Ubuntu image from Docker Hub
FROM ubuntu:noble

# Note 1: If you are not running as root user, remember to utilize "sudo" infront of each command

# Update and upgrade packages
RUN apt-get update \
    && apt-get upgrade -y
# git - For getting repositories. https://packages.ubuntu.com/noble/git
RUN apt-get install git -y
# gcc-arm-none-eabi - Arm GNU Toolchain. Includes libnewlib aswell. https://packages.ubuntu.com/noble/gcc-arm-none-eabi
RUN apt-get install gcc-arm-none-eabi -y
# usbutils - To check for the USB connection (Run: lsusb). https://packages.ubuntu.com/noble/usbutils
RUN apt-get install usbutils -y 
# make - Compile C files. https://packages.ubuntu.com/noble/make
RUN apt-get install make -y 
# openocd - Open On-chip Debugger. https://packages.ubuntu.com/noble/openocd
RUN apt-get install openocd -y
# Python3 - libopencm3 depends on it. https://packages.ubuntu.com/noble/python3
RUN apt-get python3 -y
# gdb - GNU project Debugger. https://packages.ubuntu.com/noble/gdb
RUN apt-get install gdb-multiarch -y
# build-essential - Includes dpkg-dev, g++, gcc, libc6-dev, make. https://packages.ubuntu.com/noble/build-essential
#RUN apt-get install build-essential -y 


# Expose ports for OpenOCD
# GDB Server Port
EXPOSE 3333
# Telnet Server Port
EXPOSE 4444
# TCL Server Port
EXPOSE 6666


# Get Elibopencm3 template
RUN git clone --recurse-submodules https://github.com/libopencm3/libopencm3-template.git src
RUN cd src
RUN make -C libopencm3 # only needed once

# Add our adjustments for STM32F401RE (ST Nucleo F401RE) board
RUN rm -r my-project
RUN rm -r my-common-code
RUN mv ../temp-my-project ./my-project
#RUN make -C my-project


RUN mkdir workspace
WORKDIR /workspace



