# Containerized Development Environments

This repository is meant to hold different types of **Containerized Development Environments** (CDEs) for use, demos and examples.


## List of CDEs

- STM32Cube - STM32 extension fitted into a devcontainer. (NB! Best example of devcontainer configuration setup so far).
- Desktop - Minimalistic Desktop with VNC to have a Desktop inside a devcontainer.
- PlatformIO - Devcontainer with PlatformIO extension.
- VESC - Builds/Compiles VESC Firmware.
- WireViz - Generating cable(s), wiring harnesse(s) and connector pinout documents (code-to-image)
- STM32, ARM Toolchain LibOpenCM3, OpenOCD and GDB - Build/Compile/Upload/Debug code for ARM chips (e.g. STM32F401RE)

In-Progress:
- armtoolchain - Trying to build the ARM Toolchain from official webpage


## Additional Notes

- Sometimes the cache that is reused during build might cause unwanted/unknown errors during build. Do a deep-clean of your Docker with e.g.: `sudo docker system prune -a --volumes`

- To open a project inside a **devcontainers** you have to open the specific project folder that contains the `.devcontainer`-folder. Which means, you cannot run the preconfigured files from this repository root folder, you have to open e.g. `platformio-dev-container`-folder and then spin up the devcontainer.

- To be able to access USB-devices from docker container (when running containers from a Linux OS host), run from docker-ce, NOT from Docker Desktop! [link](https://forums.docker.com/t/docker-desktop-not-working-on-ubuntu-24-04/141054/3)
    - In addition, you need to give your user permission to run docker:
        ```
        sudo usermod -aG docker $(whoami)
        ```
        This might require you to log out and in again.

