# Makefile

#
# type: make clean (to run this command)
clean:
	rm -rf build/*.o build/*.elf build/*.map


# OpenOCD load

# You find list of boards under /usr/share/openocd/scripts/board
# Programmers under .../openocd/scripts/interface/
# Specific chip under .../openocd/scripts/target/

openocd_st_nucleo_f4:
	openocd -f interface/stlink.cfg -f board/st_nucleo_f4.cfg

openocd_stm32f4x:
	openocd -f interface/stlink.cfg -f target/stm32f4x.cfg

# Upload code to MCU
upload_stm32f4x:
	openocd -s "/usr/share/openocd/scripts" -f "interface/stlink.cfg" -f "target/stm32f4x.cfg" -c "program build/final.elf verify reset exit"

# To kill the OpenOCD process that was started with "load"
# Use if you get the following error: Error: couldn't bind tcl to socket on port 6666: Address already in use
killopenocd:
	kill -9 $$(ps aux | grep '[o]penocd' | awk '{print $$2}')

# Open GNU Debugger
make gdb:
	gdb-multiarch
