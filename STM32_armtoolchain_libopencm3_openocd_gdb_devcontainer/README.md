# ARM Toolchain + ST-link Tools + OpenOCD + GDB Development Container

This devcontainer allows you to program ARM Cortex-M3,-M0,-M4 micrcontrollers with **LibOpenCM3** (including ST STM32, Toshiba TX03, Atmle SAM3U, NXP LPC1000, EFM32, and others).

NB! This repository adapted the code to fit the **STM32 Nucleo F401RE Board**.

The Devcontainer is based on these videos:
- Video 1: https://www.youtube.com/watch?v=YEGKD6JQJyM
- Video 2: https://www.youtube.com/watch?v=_1u7IOnivnM


Scripts:
- `RUN_LINUX.sh` - Installs docker correctly for conecting USB peripheral(s) to container.
- `RUN_WIN.bat` - Connects USB peripheral(s) to container. Sets up usbipd, starts docker, and connects usbipd to WSL.

**Note 1**: On the host (Windows computer), use the `RUN_WIN.bat` script in the `scripts`-folder if are spinning up the container through WSL (Windows Subsystem for Linux). This allows you to connect the microcontroller to the container. You can run the setup script from the project folder with the command `.\scripts\RUN_WIN.bat` or inside the `scripts`-folder wit `.\RUN_WIN.bat`

**Note 2**: On the host (Linux computer), use the `RUN_LINUX.bat` script in the `scripts`-folder  if you want to install docker. You can run the setup script from the project folder with the command `.\scripts\RUN_LINUX.bat` or inside the `scripts`-folder wit `.\RUN_LINUX.bat`


## HOW-TO build and upload the code with ST-Link Tools

- Change directory: `cd my-project`
- Build: `make`
    - If you have to rebuild, remember to clean up first: `rm -rf bin/ *.elf *.bin generated.*.ld`
- Check that you have a valid programmer connected: `st-info --probe`
- Flash you device: `st-flash --reset write blink-led.bin 0x8000000`


## HOW-TO use OpenOCD and debug with GDB

- Run OpenOCD: `openocd -f interface/stlink.cfg -f target/stm32f4x.cfg`
- Now you have to open a new terminal (don't close the OpenOCD terminal).
- Change directory: `cd my-project`
- Open GDB with our .elf compiled file: `gdb-multiarch ./blink-led.elf`
    - Connect GDB to OpenOCD: `target extended-remote localhost:3333`
    - First: `lay next` (Opens up a list, and shows us where in the memory we are)
    - Second: `lay next` (Opens up our source code, and show us where in the code we are)
    - Third: `lay next` (Opens Register state of the processor)
- Let's set up a break point at `main`: `break main`
- Then let code continue: `c` (this will continue our code)
    - In-case you dont reach the break point, just click on the reset button of your micrcontroller
- Let's test a step (does one step forward): `step`
    - Do a couple of more steps, until we see: `main () at my-project.c:7`
- Let's set a break point at line 18 of `my-project.c`, like this: `b 18`
    - We want to stop at the line which as the following function `gpio_toggle(GPIOA,GPIO5)` called.
- Set chip to a running state: `c`
    - This will continue until we see `Breakpoint 2, main () at my-project.c:18`
    - To remove this break point: `d 2`
- To check the state of the registers: `info registers`
    - Leave the info page with: `q`
- Let's examine (`x/`) 32 words (`32w`) in hex (`x`) at location `0x80000000`, with the command: `x/32wx 0x80000000`


## Useful links

- https://libopencm3.org/
- http://libopencm3.org/docs/latest/html/index.html
- https://github.com/libopencm3/libopencm3/wiki
- https://github.com/libopencm3/libopencm3-template
- https://github.com/lowlevellearning/stm32-bluepill-blink

