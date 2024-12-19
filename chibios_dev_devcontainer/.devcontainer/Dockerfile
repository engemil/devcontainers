# Use the (latest) Ubuntu image from Docker Hub
FROM ubuntu:noble

# Note 1: If you are not running as root user, remember to utilize "sudo" infront of each command

# Update and upgrade packages
RUN apt-get update \
    && apt-get upgrade -y
# git - For getting repositories. https://packages.ubuntu.com/noble/git
RUN apt-get install git -y
# gcc-arm-none-eabi - Arm GNU Toolchain. Includes libnewlib aswell. https://packages.ubuntu.com/noble/gcc-arm-none-eabi
# TODO: See if I should use the gcc-arm-none-eabi that ChibiStudio includes under tools (2 versions: 10.3.1 2021q4, 11.3.1 2022q3)
# The newest one as of 19.12.2024 is now 13.2.1 20231009
#RUN apt-get install gcc-arm-none-eabi -y
# usbutils - To check for the USB connection (Run: lsusb). https://packages.ubuntu.com/noble/usbutils
#RUN apt-get install usbutils -y 
# make - Compile C files. https://packages.ubuntu.com/noble/make
#RUN apt-get install make -y 
# openocd - Open On-chip Debugger. https://packages.ubuntu.com/noble/openocd
#RUN apt-get install openocd -y
# gdb - GNU project Debugger. https://packages.ubuntu.com/noble/gdb
#RUN apt-get install gdb-multiarch -y

# Expose ports for OpenOCD
# GDB Server Port
#EXPOSE 3333
# Telnet Server Port
#EXPOSE 4444
# TCL Server Port
#EXPOSE 6666


RUN mkdir /workspace

WORKDIR /workspace

# TODO: Find a solution. The volumes mounting in docker-compose.yml file makes the host folder overwrite the container folder.
#RUN git clone https://github.com/ChibiOS/ChibiOS.git




