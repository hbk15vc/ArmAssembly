# ARM assembly tutorial 001
# 
# how to build
# vi 001.asm
# arm-linux-gnueabi-as 001.asm -o 001.o
# arm-linux-gnueabi-gcc-9 001.o -o 001.elf -nostdlib
# qemu-arm ./001.elf 
# echo $?

.global _start
.section .text
	
_start:
	# set 4
	mov r7, #1 
	mov r0, #13
 
	swi 0

.section .data
