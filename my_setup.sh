#!/bin/bash

archlinux_setup()
{
	# As of 2019/12/31

	# pacman -S arm-none-eabi-gcc  # this will install 9.x, which hasn't been fully tested (https://github.com/qmk/qmk_firmware/issues/7310)
	pacman -U https://archive.archlinux.org/packages/a/arm-none-eabi-gcc/arm-none-eabi-gcc-8.3.0-1-x86_64.pkg.tar.xz
	pacman -S arm-none-eabi-binutils arm-none-eabi-newlib dfu-util

	# to run bin/qmk
	#pacman -S python-argcomplete
	#yaourt -S python-hjson python-nose2
}
