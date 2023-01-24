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

# STDOUT 1
	
_start:
	bl hello_world
	bl exit

hello_world:
	# preserve below
	push {r4-r11, lr}
	mov fp, sp
	
	# move up sp to 64 bytes
	sub sp, sp, #0x40 
	ldr r1, =#0x1337
	str r1, [fp, #-0x10]

	mov r7, #0x04
	mov r0, #1
	ldr r1, =message
	mov r2, #13
	swi 0

	mov sp, fp
	# set lr to pc legal
	pop {r4-r11, pc}
exit:
	push {fp, lr}
	
	mov r7, #0x1
	mov r0, #65
	swi 0

	pop {fp, pc}

.section .data
	message:
	.ascii "Hello, World\n"
