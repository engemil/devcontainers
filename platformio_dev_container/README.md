# Containerized Embedded Development Environment with PlatformIO Extension

(WORK-IN-PROGRESS)

How to run this container:
- Open a terminal in this folder.
- Spin up the container with the `docker-compose.yml`-file: `docker compose up -d`
    - Alternatively pull from predefined image in Docker Hub: `docker compose -f docker-compose-from-hub.yml up -d`
- Access the container with the terminal: `docker compose exec -it devenv /bin/bash`
    - Exit the container terminal: `exit`
- Stop container(s) with: `docker compose down`
    - Alternatively with specific `docker-compose`-file: `docker compose -f docker-compose-from-hub.yml down`


Run the setup script (NB! **Run as Administrator**):
- You can run the setup script...
    - from project folder: `.\script_files\RUN.bat`
    - from `script_files`: `.\RUN.bat`


If you disconnect your USB-device, you will have to run the following command when you reconnect: `usbipd attach --wsl --busid <BUSID>`
- You find the `BUSID` with: `usbipd list`



Missing scripts:
- "STOP.bat" (stop the container, detach and unbind the USB devices)
- "Installing and configure Docker Desktop". For now you need to configure it correctly to integrate with WSL (check the settings of Docker Desktop).




