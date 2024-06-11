# ARM Tool Chain Development Container

**DEPRICATED: Because I didn't want to spend to much time to compile everything while the container is being built. Made a simpler version using already existing packages.**

This devcontainer contains:
- `arm-none-eabi` version (GCC 13.2) 13.2.Rel1 (October 30, 2023)
- `make`

Scripts:
- `RUN_LINUX.sh` - Installs docker correctly for conecting USB peripheral(s) to container.
- `RUN_WIN.bat` - Connects USB peripheral(s) to container. Sets up usbipd, starts docker, and connects usbipd to WSL.


**Note 1**: Might be possible to connect a (STLink SWD) Debugger to the container to upload from the container itself. For Windows, will need to use **usbipd-win** to connect the debugger to the container. Check the `platformio_devcontainer` for inspiration.

**Note 2**: Use the `RUN.bat` script in the `script_files`-folder (on the host Windows Computer), if you are on Windows and are spinning up the container through WSL (Windows Subsystem for Linux). This allows you to connect the microcontroller to the container. You can run the setup script from the project folder with the command `.\script_files\RUN.bat` or inside the `script_files`-folder wit `.\RUN.bat`



**Useful link(s):**
- gcc.gnu.org/onlinedocs/gcc/index.html
- https://dev.to/dalimay28/using-docker-for-embedded-systems-development-b16

# Example

The `src_example` is used as example to test out the functionalities of the ARM Toolchain, OpenOCD, and GNU Debugger.

**Windows**
- If you are on Windows, remember to configure your USB-device to connect to the container with `usbipd`. Check the scripts in `script`-folder. I recommend you to run `./RUN.bat` file.

**Linux**
- If you are on Linux, remember to spin-up the container from docker-ce, and not Docker Desktop. To make sure you can access your USB-devices in the container.

**Example**

- Check that the device is connected to the container with: `lsusb`
    - You should see something like this:
        ```
        Bus 001 Device 003: ID 0483:374b STMicroelectronics STM32 STLink
        ```
- Open a terminal (in container) and go into the `src`-folder: `cd src`
- To build/compile our code, run: `make all`
- Now starts OpenOCD with: `make load`
    - If it gives you an `Address already in use` error, run first: `make killopenocd`
- Then, open a new terminal and start GNU Debugger: `make gdb`
    - Run: `target extended-remote localhost:3333` 
        - In the OpenOCD terminal you can see the following:
            ```
            Info : accepting 'gdb' connection on tcp/3333
            ```
            Which means the GDB has connected to openOCD
    - Lets continue: `monitor reset init`
    - Flash the firmware to the microcontroller: `monitor flash write_image erase ./build/final.elf`
    - Reset the monitor, but halt it right away: `monitor reset halt`
    - To continue the program: `monitor resume`
        - You'll now see the program running
    - To reset the board: `monitor reset`
        - 







