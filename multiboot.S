#define DEF_MBH_MAGIC	0x1BADB002
#define DEF_MBH_FLAGS	0x00000003
#define DEF_MBH_CHECKSUM	-(DEF_MBH_MAGIC+DEF_MBH_FLAGS)

.extern _kernel_entry

.text
.code32
.global	start,_start

start:
 _start:
	jmp	multiboot_entry
	.align 	4

multiboot_header:
	.long	DEF_MBH_MAGIC
	.long	DEF_MBH_FLAGS
	.long	DEF_MBH_CHECKSUM

multiboot_entry:
	pushl	$0
	popf
	pushl	%ebx
	pushl	%eax

	call	go.kernel.StartKernel

loop_infinite:
	hlt
	jmp	loop_infinite
