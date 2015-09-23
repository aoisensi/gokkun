gccgo -c -static -nostdlib -nostartfiles -nodefaultlibs -fno-split-stack kernel.go
gcc -c -o multiboot.o multiboot.S
ld multiboot.o kernel.o -o image
