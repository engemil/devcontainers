ENTRY(Reset_Handler)

MEMORY
{
    FLASH(rx) : ORIGIN = 0x08000000, LENGTH = 1024K /* Code Memory */
    SRAM(rwx) : ORIGIN = 0x20000000, LENGTH = 128K /* Data Memory */
}

/* Examples of symbols */
__max_heap_size = 0x400; /* Symbol declaration, not a variable! */
__max_stack_size = 0x200; /* Symbol declaration, not a variable! */

SECTIONS
{
    /* This section should include .text sectin of all input files */
    .text :
    {
        /* Merge all .isr_vector section of all input files */
        /* the wild card (*) is unecessary, since we only have one isr_vector section */
        /* *(.isr_vector) */
        /* Gets discarded, due to not referenced in the .o files */
        /* Use KEEP() to avoid being discarded */
        KEEP(*(.isr_vector))
        /* Merge all .text section of all input files */
        *(.text)
        /* Merge all .rodata section of all inpput files */
        *(.rodata)
        . = ALIGN(4);
        end_of_text = .; /* Store the updated location counter value in to a symbol end_of_text */
        /* We can export end_of_text to know how long the .text section is */
        /* alternative naming _etext = .; */
    }> FLASH AT> FLASH
    /* alternative: }> FLASH */
    /* Since the vma and lma are the same in this case */
    /* syntax: }> (vma) AT> (lma)) */

    _la_data = LOADADDR(.data);

    /* This section should include .data section of all input files */
    .data :
    {
        _sdata = .; /* Address of start of .data section */
        /*start_of_data = 0x20000000; /* Assign a vlue to a symbol start_of_data */
        /* merge all .data section of all input files */
        *(.data)
        . = ALIGN(4);
        _edata = .;
    }> SRAM AT> FLASH

    .bss :
    {
        _sbss = .;
        *(.bss)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
    }> SRAM

}
