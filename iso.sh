#!/bin/sh
set -e
. ./build.sh
 
mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub
 
cp sysroot/boot/puppyos.kernel isodir/boot/puppyos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "puppyos" {
	multiboot /boot/puppyos.kernel
}
EOF
grub-mkrescue -o puppyos.iso isodir
