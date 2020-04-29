#!/bin/bash

# As of 2019/12/32
#
# My first customized keyboard and keymap settings
#
# It's a PCB from kbdfans.com
# (https://kbdfans.com/collections/60/products/dz60rgb-ansi-mechanical-keyboard-pcb)
#
# build:
#     make dztech/dz60rgb_ansi/v1:ckyoog
#
# flash:
#     make dztech/dz60rgb_ansi/v1:ckyoog:flash
#
# "v1" is ARM, "v2" is AVR
#
# Its DFU (bootloader) is STM32 BOOTLOADER. The following is the
# screenshot from `dmesg'.
#         [247129.278661] usb 1-1.2: Product: STM32  BOOTLOADER
#         [247129.278661] usb 1-1.2: Manufacturer: STMicroelectronics
#         [247129.278662] usb 1-1.2: SerialNumber: 206E31622037
#
# The way to enter DFU mode is to unplug the keyboard, press and hold key
# ESC, plug in the keyboard and wait a second before releasing the key.
#
# My changes are based on master of https://github.com/qmk/qmk_firmware,
# which is several commits ahead of the last tag 0.7.106 as of 2019/12/31.

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

# As of 2020/4/29
#
# The first PCB I bought (see comments above) stopped working after 1
# month using. I asked the vendor to send me a replacement. The pandemic
# of COVID-19 happened to outbreak at that time unfortunately, so I got
# the new one after 3 months waiting. Good news, it is V2. (The old
# broken one is V1). So following is the updated command for build and
# flash.
#
# build:
#     make dztech/dz60rgb_ansi/v2:ckyoog
#
# flash:
#     make dztech/dz60rgb_ansi/v2:ckyoog:flash
#
# And as I said, "v1" is ARM, "v2" is AVR. So this time, AVR toolchain
# is needed. And this time I was working on my MacBook Pro, so I set up
# the environment of compiling in macOS (see the function below)
#
# The v2 DFU (bootloader) is ATM DFU. The following is the screenshot
# from `dmesg'.
#         [19195.868134] usb 4-1: Product: ATm32U4DFU
#         [19195.868138] usb 4-1: Manufacturer: ATMEL
#         [19195.868142] usb 4-1: SerialNumber: 1.0.0
#
# I added the QMK repo as upstream, and sync'ed up my own master with
# the upstream master, which is one commit ahead of the latest tag
# 0.8.137, as of 2019/4/29.

macos_setup()
{
	# As of 2020/4/29

	# for dz60rgb_ansi v1
	#brew tap osx-cross/arm
	#brew update
	#brew install arm-gcc-bin@8 dfu-util
	#brew link --force arm-gcc-bin@8

	# for dz60rgb_ansi v1
	brew tap osx-cross/avr
	brew update
	brew install avr-gcc@8 avrdude dfu-programmer
	brew link --force avr-gcc@8
}
