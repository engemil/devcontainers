# MPLAB Microchip VS Code Devcontainer

This project is the base for running MPLAB (Microchip MCU development environment) in VS Code inside a container.


## HOW-TO

- Install **VS Code**
- Add the **Dev Containers**-extension to **VS Code**
- Install **Docker** by one of one these:
    - **Docker Desktop**
    - The convencience script:
        ```
        curl -fsSL https://get.docker.com -o get-docker.sh
        sudo sh ./get-docker.sh --dry-run
        ```
    - Recommended to install **Docker**-extension in **VS Code** aswell.
- Open this project in **VS Code** and click on the bottom left corner
    - You get prompted, select: **Reopen in container**
- Wait for it to build and spin up.

Now you have a container you can develop MPLAB projects, that integrates well with VS Code.


(WORK-IN-PROGRESS)
- Need to test this devcontainer by making a simple project, build and flash a micrcontroller.


## Useful links:

- https://www.microchip.com/en-us/tools-resources/develop/microchip-studio
- https://www.microchip.com/en-us/tools-resources/develop/mplab-extensions-vs-code
- https://marketplace.visualstudio.com/items?itemName=Microchip.mplab-extension-pack

