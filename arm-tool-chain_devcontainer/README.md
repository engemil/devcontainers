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
- Let's generate the object-file: `arm-none-eabi-gcc -c main.c -o main.o`
    - This will give you the following error:
    ```
    /tmp/ccSTcaAd.s: Assembler messages:
    /tmp/ccSTcaAd.s:309: Error: selected processor does not support requested special purpose register -- `msr MSP,r3'
    /tmp/ccSTcaAd.s:655: Error: selected processor does not support requested special purpose register -- `msr PSP,R0'
    /tmp/ccSTcaAd.s:664: Error: selected processor does not support requested special purpose register -- `msr CONTROL,R0'
    /tmp/ccSTcaAd.s:721: Error: selected processor does not support requested special purpose register -- `msr PRIMASK,R0'
    /tmp/ccSTcaAd.s:754: Error: selected processor does not support requested special purpose register -- `msr PRIMASK,R0'
    /tmp/ccSTcaAd.s:782: Error: selected processor does not support requested special purpose register -- `mrs R0,PSP'
    /tmp/ccSTcaAd.s:803: Error: selected processor does not support requested special purpose register -- `msr PSP,R0'
    ```
    **This is because we have not specified yet the architecture!**
- Now let's try with the target process (`cortex-m4`): `arm-none-eabi-gcc -c -mcpu=cortex-m4 main.c -o main.o`
- This generated out `main.o` object file.

The `src_example` is used as example to test out the functionalities of the ARM Tool Chain.


