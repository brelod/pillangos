#!/bin/sh

echo "================================================================================"
echo "Create partition table"
echo "================================================================================"
sfdisk /dev/sda < /etc/partitions

echo "================================================================================"
echo "Create filesystems"
echo "================================================================================"
mkfs.ext2 -F            /dev/sda1
mkfs.ext4 -F            /dev/sda2
mkfs.ext4 -F            /dev/sda3

echo "================================================================================"
echo "Mount filessystems"
echo "================================================================================"
mount -v /mnt
mkdir -p /mnt/boot
mount -a 

echo "Extract system archive"
tar xf /pillangos.tar.gz -C /mnt/

echo "Install bootloader"
dd bs=440 conv=notrunc count=1 if=/boot/gptmbr.bin of=/dev/sda
extlinux --install /mnt/boot/extlinux

echo "Unmount filesystems"
umount -a

