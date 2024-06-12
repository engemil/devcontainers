# Use the (latest) Ubuntu image from Docker Hub
FROM ubuntu:latest

# Note 1: If you are not running as root user, remember to utilize "sudo" infront of each command

# Update and upgrade packages
RUN apt-get update \
    && apt-get upgrade -y

RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install python3.8
    
# git - For getting repositories. https://packages.ubuntu.com/noble/git
RUN apt-get install git -y
# gcc-arm-none-eabi - Arm GNU Toolchain. Includes libnewlib aswell. https://packages.ubuntu.com/noble/gcc-arm-none-eabi
#RUN apt-get install gcc-arm-none-eabi -y
# usbutils - To check for the USB connection (Run: lsusb). https://packages.ubuntu.com/noble/usbutils
RUN apt-get install usbutils -y 
# make - Compile C files. https://packages.ubuntu.com/noble/make
#RUN apt-get install make -y 
# openocd - Open On-chip Debugger. https://packages.ubuntu.com/noble/openocd
#RUN apt-get install openocd -y
# Python3 - libopencm3 depends on it. https://packages.ubuntu.com/noble/python3
#RUN apt-get python3 -y
# gdb - GNU project Debugger. https://packages.ubuntu.com/noble/gdb
#RUN apt-get install gdb-multiarch -y
# build-essential - Includes dpkg-dev, g++, gcc, libc6-dev, make. https://packages.ubuntu.com/noble/build-essential
RUN apt-get install build-essential -y 
# wget - For downloading files. https://packages.ubuntu.com/noble/wget
RUN apt-get install wget -y 

# gnupg2 - https://packages.ubuntu.com/noble/gnupg2
RUN apt-get install gnupg2 -y 


# Dependencies For python (to fix arm-none-eabi-gdb)
# curl - For downloading files. https://packages.ubuntu.com/noble/curl
#RUN apt-get install curl
#RUN apt-get install build-essential
#RUN apt-get install libssl-dev
#RUN apt-get install zlib1g-dev
#RUN apt-get install libbz2-dev
#RUN apt-get install libreadline-dev
#RUN apt-get install libsqlite3-dev
#RUN apt-get install libncursesw5-dev
#RUN apt-get install xz-utils
#RUN apt-get install tk-dev
#RUN apt-get install libxml2-dev
#RUN apt-get install libxmlsec1-dev
#RUN apt-get install libffi-dev
#RUN apt-get install liblzma-dev

#RUN pyenv install 3.8.18
# sudo mkdir -p /usr/local/bld-tools
# sudo ln -s $PYENV_ROOT/versions/3.8.18 /usr/local/bld-tools/bld-tools-virtual-env






# Expose ports for OpenOCD
# GDB Server Port
EXPOSE 3333
# Telnet Server Port
EXPOSE 4444
# TCL Server Port
EXPOSE 6666


# Import the missing public (is it needed?)
#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 871920D1991BC93C

# Download and install gcc-arm toolchain for the specified architecture
# https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

RUN CPUARCH=$(uname -m) && \
    if [ "$CPUARCH" = "x86_64" ]; then \
        wget -q    https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz \
        && tar -xvf *64-arm-none-eabi.tar.xz \
        && rm *64-arm-none-eabi.tar.xz \
        && wget -q https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-aarch64-none-elf.tar.xz  \
        && tar xf *-aarch64-none-elf.tar.xz \
        && rm *-aarch64-none-elf.tar.xz \
        && ln -s /arm-gnu-toolchain-13.2.Rel1-x86_64-aarch64-none-elf /toolchain-none-elf \
        && ln -s /arm-gnu-toolchain-13.2.Rel1-x86_64-arm-none-eabi /toolchain-none-eabi; \
    elif [ "$CPUARCH" = "arm64" ]; then \
        wget -q    https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-aarch64-arm-none-eabi.tar.xz \
        && tar -xvf *64-arm-none-eabi.tar.xz \
        && rm *64-arm-none-eabi.tar.xz \
        && wget -q https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-aarch64-aarch64-none-elf.tar.xz \
        && tar xf *-aarch64-none-elf.tar.xz \
        && rm *-aarch64-none-elf.tar.xz \
        && ln -s /arm-gnu-toolchain-13.2.Rel1-aarch64-aarch64-none-elf /toolchain-none-elf \
        && ln -s /arm-gnu-toolchain-13.2.Rel1-aarch64-arm-none-eabi /toolchain-none-eabi; \
    else \
        echo "Unsupported architecture: $CPUARCH"; \
        exit 1; \
    fi

# Create links, for the binaries to be accessible system-wide
# Just go to the /usr/share/arm-gnu-toolchain-*/bin/ folder and see what else you want to have globally available
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-g++ /usr/bin/arm-none-eabi-g++
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-gdb /usr/bin/arm-none-eabi-gdb
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-size /usr/bin/arm-none-eabi-size
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-objcopy /usr/bin/arm-none-eabi-objcopy
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-objdump /usr/bin/arm-none-eabi-objdump
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-nm /usr/bin/arm-none-eabi-nm

# Let's now fix arm-none-eabi-gdb
RUN ln -s /usr/lib/x86_64-linux-gnu/libncurses.so.6 /usr/lib/x86_64-linux-gnu/libncurses.so.5
RUN ln -s /usr/lib/x86_64-linux-gnu/libncursesw.so.6 /usr/lib/x86_64-linux-gnu/libncursesw.so.5
RUN ln -s /usr/lib/x86_64-linux-gnu/libtinfo.so.6 /usr/lib/x86_64-linux-gnu/libtinfo.so.5



RUN mkdir workspace
WORKDIR /workspace
