.globl main

.equ items, 12
.equ datum_size,4
.section .rodata
before:
	.asciz "Before sorting, values are : %d" 
after:
	.asciz "After sorting,  values are : %d"
comma:
	.asciz ", %d"
new_line:
	.asciz "\n"
ok:
	.asciz "ok\n"
.section .data
values:
	.word 10, -77, 23, 6, 28, 31, 46, 63, 134, 97, 21, 53
evalues:
	.word 1, 2, 3

.text
main:
	ldr	r0, =values
	mov	r1, #items
	ldr	r2, =before
	ldr	r3, =comma
	bl	_vprintw
	ldr	r0, =new_line
	bl 	printf

	ldr	r0, =values
	mov	r1, #items
	bl	bubble

	ldr	r0, =values
	mov	r1, #items
	ldr	r2, =after
	ldr	r3, =comma
	bl	_vprintw
	ldr	r0, =new_line
	bl 	printf

	mov     r7, #1		@ set r7 to 1 - the syscall for exit
	swi     0		@ then invoke the syscall from linux
