# VESC Development Container

This repository is to build/compile firmware for the VESC https://github.com/vedderb/bldc 



## Compiling/build

To compile/build your firmware for the VESC run the following command: `make <VESC_TYPE>` (e.g. `make 100_250`).

To see a list of supported boards: `make help`


## Upload to VESC

**Method 1** - Flash it using an **STLink SWD debugger** (**NB!** Container not configured for this method)

1. Build and flash the bootloader first (https://github.com/vedderb/bldc-bootloader)
1. Then use the `_flash` postfix, e.g.: `make 100_250_flash`

Extra note: Might be possible to connect a STLink SWD Debugger to the container to upload from the container itself. Will need to use **usbipd-win** to connect the debugger to the container. Chekc the `platformio_devcontainer` for inspiration.

**Method 2** - Upload firmware via **VESC Tool** through **USB**

1. It's really simple, from the compiled files, you just upload the `.bin`-file in the VESC Tool.


## Additional information:

- To make your custom hardware, checkout: https://github.com/vedderb/bldc/tree/master/hwconf/example
- To make your custom application for VESC, checkout: https://github.com/vedderb/bldc/blob/master/applications/app_custom_template.c

