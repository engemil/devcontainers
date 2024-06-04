# ARM Tool Chain Development Container

This devcontainer contains:
- `arm-none-eabi` version (GCC 13.2) 13.2.Rel1 (October 30, 2023)
- `make`



**Note 1**: Might be possible to connect a (STLink SWD) Debugger to the container to upload from the container itself. For Windows, will need to use **usbipd-win** to connect the debugger to the container. Check the `platformio_devcontainer` for inspiration.

**Note 2**: Use the `RUN.bat` script in the `script_files`-folder (on the host Windows Computer), if you are on Windows and are spinning up the container through WSL (Windows Subsystem for Linux). This allows you to connect the microcontroller to the container. You can run the setup script from the project folder with the command `.\script_files\RUN.bat` or inside the `script_files`-folder wit `.\RUN.bat`



**Useful link(s):**
- gcc.gnu.org/onlinedocs/gcc/index.html
- https://dev.to/dalimay28/using-docker-for-embedded-systems-development-b16

# Example

To use this I added example files to try out in the `/src`-folder.
- Open a terminal an go into the `src`-folder: `cd src`
- To test it out, run: `make all`
    - This generated out `main.o` object file.
- 


The `src_example` is used as example to test out the functionalities of the ARM Tool Chain.


