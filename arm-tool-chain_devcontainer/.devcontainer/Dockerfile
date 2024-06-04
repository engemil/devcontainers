# Use the latest Ubuntu image from Docker Hub
FROM ubuntu:latest

# Note 1: The source of this code is https://askubuntu.com/questions/1243252/how-to-install-arm-none-eabi-gdb-on-ubuntu-20-04-lts-focal-fossa
# Note 2: If you are not running as root user, remember to utilize "sudo" infront of each command

# Update packages
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install git -y \
    && apt-get install wget -y \
    && apt-get install xz-utils -y \
    && apt-get install make -y \
    && apt-get install usbutils -y \
    && apt-get install openocd -y
    #&& apt-get install libncurses-dev -y
    # usbutils - To check for the USB connection (Run: lsusb)

# Expose ports for OpenOCD and GDB
# GDB Server Port
EXPOSE 3333
# Telnet Server Port
EXPOSE 4444
# TCL Server Port
EXPOSE 6666


# Download the ARM GNU Toolchain
# Find the newest version from https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
# NB! If this doesn't work, remember to specify the DNS server in Docker daemon config to 8.8.8.8 and 8.8.4.4
ARG ARM_GNU_PACKAGE_LINK=https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz?rev=e434b9ea4afc4ed7998329566b764309&hash=688C370BF08399033CA9DE3C1CC8CF8E31D8C441
ARG ARM_GNU_PACKAGE_OUTPUT_FILE_NAME=arm-gnu-toolchain_package.tar.xz
RUN wget "$ARM_GNU_PACKAGE_LINK" -O $ARM_GNU_PACKAGE_OUTPUT_FILE_NAME

# Unpack it into the /usr/share directory
RUN tar xf $ARM_GNU_PACKAGE_OUTPUT_FILE_NAME -C /usr/share
# In my case this generated the following folder /usr/share/arm-gnu-toolchain-13.2.Rel1-x86_64-arm-none-eabi

# Remove the .tar.xz file
RUN rm -r $ARM_GNU_PACKAGE_OUTPUT_FILE_NAME

# Create links, for the binaries to be accessible system-wide
# Just go to the /usr/share/arm-gnu-toolchain-*/bin/ folder and see what else you want to have globally available
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-g++ /usr/bin/arm-none-eabi-g++
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-gdb /usr/bin/arm-none-eabi-gdb
#RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-gdb /usr/bin/gdb
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-size /usr/bin/arm-none-eabi-size
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-objcopy /usr/bin/arm-none-eabi-objcopy
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-objdump /usr/bin/arm-none-eabi-objdump
RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-nm /usr/bin/arm-none-eabi-nm
# Dependencies
RUN ln -s /usr/lib/x86_64-linux-gnu/libncurses.so.6 /usr/lib/x86_64-linux-gnu/libncurses.so.5
RUN ln -s /usr/lib/x86_64-linux-gnu/libtinfo.so.6 /usr/lib/x86_64-linux-gnu/libtinfo.so.5


# Work in progress

#RUN wget http://archive.ubuntu.com/ubuntu/pool/universe/n/ncurses/libtinfo5_6.4-2_amd64.deb
#RUN dpkg -i libtinfo5_6.4-2_amd64.deb
#RUN rm -f libtinfo5_6.4-2_amd64.deb
#RUN wget http://archive.ubuntu.com/ubuntu/pool/universe/n/ncurses/libncurses5_6.4-2_amd64.deb
#RUN dpkg -i libncurses5_6.4-2_amd64.deb
#RUN rm -f libncurses5_6.4-2_amd64.deb
#RUN wget http://archive.ubuntu.com/ubuntu/pool/universe/n/ncurses/libncursesw5_6.4-2_amd64.deb
#RUN dpkg -i libncursesw5_6.4-2_amd64.deb
#RUN rm -f libncursesw5_6.4-2_amd64.deb
#RUN apt install libncurses5 libncursesw5 -y
#RUN apt list --installed | grep libncurses
#RUN arm-none-eabi-gdb

#RUN apt-get install python3 -y \
#    && apt-get install python3-pip -y

#RUN apt-get install python-is-python3 -y

#RUN pip install text_encoding

#RUN export PYTHONHOME=/usr
#RUN export PYTHONPATH=/usr/lib/python3.12:/usr/lib/python3.12/lib-dynload:/usr/lib/python3.12/encodings



# Download and install GDB
#ARG GDB_VERSION=gdb-14.2
#RUN wget http://ftp.gnu.org/gnu/gdb/($GDB_VERSION).tar.xz
#RUN tar -xvf ($GDB_VERSION).tar.xz
#run rm -r ($GDB_VERSION).tar.xz
#RUN cd ($GDB_VERSION)
#RUN ln -s /usr/share/arm-gnu-toolchain-*/bin/arm-none-eabi-gcc /usr/bin/gcc
#RUN ./configure
#RUN make
#RUN make install
# Or
#RUN apt-get install gdb -y


#RUN mkdir workspaces

WORKDIR /



