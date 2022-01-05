#!/bin/sh
BOARD_DIR="$(dirname $0)"

cp $BOARD_DIR/Allwinner-tools/* -rfvd   $BINARIES_DIR
cd $BINARIES_DIR
$BINARIES_DIR/dragonsecboot  -pack boot_package.cfg
echo "boot.img ....."
mkbootimg --kernel  Image  --ramdisk  ramdisk.img --board  d1-nezha_min --base  0x40200000 --kernel_offset  0x0 --ramdisk_offset  0x01000000 -o  boot.img
