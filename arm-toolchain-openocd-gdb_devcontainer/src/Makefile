# Makefile
# To compile/build: make all'


# Variables
CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -Wall -o0
LDFLAGS= -nostdlib -T stm32_ls.ld -Wl,-Map=final.map

# Compile/Build code
# type: make all (to run this command)
all:main.o led.o stm32_startup.o final.elf
main.o:main.c
	$(CC) $(CFLAGS) -o $@ $^
led.o:led.c
	$(CC) $(CFLAGS) -o $@ $^
stm32_startup.o:stm32_startup.c
	$(CC) $(CFLAGS) -o $@ $^
final.elf:main.o led.o stm32_startup.o
	$(CC) $(LDFLAGS) -o $@ $^
	@mkdir -p build
	@mv main.o led.o stm32_startup.o final.elf final.map build/


#
# type: make clean (to run this command)
clean:
	rm -rf build/*.o build/*.elf build/*.map

# 
openocd:
	openocd -f interface/stlink.cfg -f board/st_nucleo_f4.cfg
#openocd -f board/st_nucleo_f4.cfg -f interface/stlink.cfg
# You find the list of boards for OpenOCD under /usr/share/openocd/scripts/board , in our case it's st_nucleo_f4.cfg

# To kill the OpenOCD process that was started with "load"
# Use it it you get the following error: Error: couldn't bind tcl to socket on port 6666: Address already in use
killopenocd:
	kill -9 $$(ps aux | grep '[o]penocd' | awk '{print $$2}')


# Upload code to MCU
upload:
	openocd -s "/usr/share/openocd/scripts" -f "interface/stlink.cfg" -f "target/stm32f4x.cfg" -c "program build/final.elf verify reset exit"

# Open GNU Debugger
make gdb:
	gdb-multiarch ./build/final.elf

