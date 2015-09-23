package kernel

import "unsafe"

func StartKernel(a, b uint64) {
	*(*uint16)(unsafe.Pointer(uintptr(0xB8000))) = '@' + 0x07 << 8
}
