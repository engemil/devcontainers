# Use the latest Ubuntu image from Docker Hub
FROM ubuntu:latest

# update packages and install python
RUN apt-get update \
    && apt-get install python3 -y \
    && apt-get install python3-venv -y

# Set Python 3 as the default python interpreter
RUN ln -s /usr/bin/python3 /usr/bin/python

# (optional) Install usb utilites, to check for the USB connection
RUN apt-get install usbutils -y
# Run lsusb in the container to get list of USB connections

## FOR NOW only PlatformIO Extensions with devcontainers ##
# Set up udev rules for PlatformIO
#RUN curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/platformio/assets/system/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
#RUN service udev restart 
#RUN usermod -a -G dialout vscode
#RUN usermod -a -G plugdev vscode

#ARG FEDORA_COMPAT=0
### Set up compatibility with Fedora host (if needed)
### Since Fedora uses `18` as the group for dialout, we need to add it to the container
#RUN if [ "$FEDORA_COMPAT" = "1" ]; then \
#  sudo groupadd -g 18 compat_dialout; \
#  sudo usermod -a -G compat_dialout vscode; \
#fi

## FOR NOW only PlatformIO Extensions with devcontainers ##
# Install PlatformIO CLI
#USER vscode
#RUN curl -fsSL -o /tmp/get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
#RUN python3 /tmp/get-platformio.py
#RUN echo 'export PATH="$PATH:$HOME/.platformio/penv/bin"' | tee -a /home/vscode/.bashrc /home/vscode/.zshrc 
#RUN echo 'export PATH="$PATH:$HOME/.platformio/penv/bin"' | sudo tee -a /root/.bashrc /root/.zshrc

