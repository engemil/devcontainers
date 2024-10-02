# Use the latest Ubuntu image from Docker Hub
# NB! Ubuntu 22.04 is the latest compatible version for stm32cubeclt
FROM ubuntu:22.04

# update packages and install python
RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install unzip -y
RUN apt-get install usbutils -y
# Note usbutils: command lsusb to get list of USB connections
RUN apt-get install pip -y
# For ubuntu:24.04 or older use this to install gdown
#RUN pip install gdown --break-system-packages
# For ubuntu:22.04 use this to install gdown
RUN pip install gdown

# NB! Remember to make the files' (in Google Drive) general access to: Anyone with the link

# File: en.stm32cubemx-lin-v6-12-0.zip
# Link: https://drive.google.com/file/d/1cyilUgvb1sxLrIDUNWJXiyFKCwuCRyGU/view?usp=drive_link
RUN gdown https://drive.google.com/uc?id=1cyilUgvb1sxLrIDUNWJXiyFKCwuCRyGU
RUN unzip en.stm32cubemx-lin* -d stm32cubemx
RUN rm -r en.stm32cubemx-lin*

# File: en.st-mcu-finderlin-v6-0-0.zip
# Link: https://drive.google.com/file/d/1Gd_v5b0jyH8mPVRh2CZVHmjVlaHckWi4/view?usp=sharing
RUN gdown https://drive.google.com/uc?id=1Gd_v5b0jyH8mPVRh2CZVHmjVlaHckWi4
RUN unzip en.st-mcu-finderlin* -d stmMCUfinder
RUN rm -r en.st-mcu-finderlin*

# File: en.st-stm32cubeclt_1.16.0_21983_20240628_1741_amd64.deb_bundle.sh.zip
# Link: https://drive.google.com/file/d/1EXB2u8Yym7Zf5RwnBwHR5DWssPfmzy55/view?usp=sharing
RUN gdown https://drive.google.com/uc?id=1EXB2u8Yym7Zf5RwnBwHR5DWssPfmzy55
RUN unzip en.st-stm32cubeclt* -d stm32cubeclt
RUN rm -r en.st-stm32cubeclt*

# Setup STM32CubeCLT
ENV LICENSE_ALREADY_ACCEPTED=1
RUN sh /stm32cubeclt/st-stm32*
RUN rm -r stm32cubeclt
# NOTE: STM32CubeCLT is now installed under /opt/st/stm32cubeclt_<verions>

# For STM32CubeMX and STMCUFinder installation propgram
RUN apt-get install -y libxext6 libxrender1 libxtst6 libxi6 libxrandr2 libfreetype6 libfontconfig1

# Setup STM32CubeMX
COPY ./.stm32-install-scripts/stm32cubemx/auto-install.xml /stm32cubemx/auto-install.xml
RUN /stm32cubemx/SetupSTM32CubeMX* -q -varfile /stm32cubemx/auto-install.xml
RUN rm -r stm32cubemx
# NOTE 1: If you do NOT have the auto-install.xml file available for STM32CubeMx, you need to do this process manually to generate it. RUN this script SetupSTM32CubeMX*
#       If you ran this from VS Code Terminal it will prompt you to an install GUI, but it runs inside the container (This is some black-magic stuff for me).
#       At end of the installation click "Generate an automatic installation script". THIS ONE WILL BE USED IN THIS DOCKERFILE TO AUTOMATIC INSTALL STM32CubeMX.
#       Automatic installation script is default placed in /usr/local/STMicroelectronics/STM32Cube/STM32CubeMX/auto-install.xml
# NOTE 2: STM32CubeMX is now installed under /usr/local/STMicroelectronics/STM32Cube/STM32CubeMX

# Setup ST MCUFinder
COPY ./.stm32-install-scripts/stmcufinder/auto-install.xml /stmMCUfinder/auto-install.xml
RUN /stmMCUfinder/SetupSTMCUFinder* -q -varfile /stmMCUfinder/auto-install.xml
RUN rm -r stmMCUfinder
# NOTE 1: If you do NOT have the auto-install.xml file available for ST MCUFinder, you need to do this process manually to generate it. RUN this script SetupSTMCUFinder*
#       If you ran this from VS Code Terminal it will prompt you to an install GUI, but it runs inside the container (This is some black-magic stuff for me).
#       At end of the installation click "Generate an automatic installation script". THIS ONE WILL BE USED IN THIS DOCKERFILE TO AUTOMATIC INSTALL STM32CubeMX.
#       Automatic installation script is default placed in /usr/local/STMicroelectronics/STMCUFinder/auto-install.xml
# NOTE 2: ST MCUFinder is now installed under /usr/local/STMicroelectronics/STMCUFinder


#RUN mkdir workspace
#WORKDIR /workspace