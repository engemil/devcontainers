# Use the latest Ubuntu image from Docker Hub
FROM ubuntu:latest

# update packages and install python
RUN apt-get update \
    && apt-get install python3 -y \
    && apt-get install python3-pip -y \
    && apt-get install graphviz -y

# Set Python 3 as the default python interpreter
RUN ln -s /usr/bin/python3 /usr/bin/python

# Install WireViz
RUN pip3 install WireViz

# Change directory to the repository folder
WORKDIR /wireviz/build