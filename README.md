# Containerized Development Environments

This repository is meant to hold different types of **Containerized Development Environments** (CDEs) for use, demos and examples.


## List of CDEs

- Desktop - Minimalistic Desktop with VNC to have a Desktop inside a devcontainer.
- Alternatives - Different ways to spin up a devcontainer from an image, dockerfile or docker compose file.
- PlatformIO - Devcontainer with PlatformIO extension.
- VESC - Builds/Compiles VESC Firmware.
- WireViz - Generating cable(s), wiring harnesse(s) and connector pinout documents (code-to-image)


## Additional Notes

- To open a project inside a **devcontainers** you have to open the specific project folder that contains the `.devcontainer`-folder. Which means, you cannot run the preconfigured files from this repository root folder, you have to open e.g. `platformio-dev-container`-folder and then spin up the devcontainer.

