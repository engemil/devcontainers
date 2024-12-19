# ChibiOS Example

This is a devcontainer example for STM32F401RE NUCLEO, which includes an ST-Link for easy development over USB.

**Get ChibiOS**
- In the workspace-folder: `git clone https://github.com/ChibiOS/ChibiOS.git`

**To Compile**
- Go into the demo folder that we already have: `cd RT-STM32F401RE-NUCLEO64`
- Build: `make`

**To Flash to Chip**

- First, check which "board"-config file and "interface"-config file that matches your system.
    - Set up openocd, for Nucleo STM32F401RE: `openocd -f board/st_nucleo_f4.cfg -f interface/stlink.cfg`
        - Location of board scripts: `/usr/share/openocd/scripts/board/`
        - Location of interface scripts: `/usr/share/openocd/scripts/interface/`
- Prepare GNU Debugger (GBD): `gdb-multiarch /workspace/RT-STM32F401RE-NUCLEO64/build/ch.elf`
    - Connect the GBD to openOCD: `target remote localhost:3333`
    - Flash: `load`
 - After loading ther firmware, you can reset the target and start execution: `monitor reset init`
    - Start execution: `continue` or `c`

You should now see the led light (LD2) flash!

To quit the GDB: **CTRL + C** and then type `quit` + **ENTER**
