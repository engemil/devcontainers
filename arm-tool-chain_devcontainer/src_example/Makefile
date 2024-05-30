
CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -Wall -o0
LDFLAGS= -nostdlib -T stm32_ls.ld -Wl,-Map=final.map

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

# type: make clean (to run this command)
clean:
	rm -rf *.o *.elf *.map

load:
	openocd -f board/st_nucleo_f4.cfg
#openocd -f board/st_nucleo_f4.cfg -f interface/stlink.cfg
# You find the list of boards for OpenOCD under /usr/share/openocd/scripts/board , in our case it's st_nucleo_f4.cfg

