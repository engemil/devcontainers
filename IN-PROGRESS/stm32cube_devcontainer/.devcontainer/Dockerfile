# Use the latest Ubuntu image from Docker Hub
# NB! Ubuntu 22.04 is the latest compatible version for stm32cubeclt
FROM ubuntu:22.04
#FROM ubuntu:22.04

# update packages and install python
RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install unzip -y
#RUN apt-get install usbutils -y
# Run lsusb in the container to get list of USB connections

RUN apt-get install pip -y
# For ubuntu:24.04 or older
#RUN pip install gdown --break-system-packages
# For ubuntu:22.04
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

RUN cd stm32cubeclt
RUN echo "y" | sh ./st-stm32*
RUN cd ..
#RUN rm -r stm32cubeclt


# TO BE CONTINUED

RUN mkdir workspace
WORKDIR /workspace
