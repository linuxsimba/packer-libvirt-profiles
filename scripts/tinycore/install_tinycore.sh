#!/bin/bash
set -eux

/usr/local/sbin/parted -s /dev/vda \
  mklabel msdos \
  mkpart primary ext4 2048s 90M \
  mkpart primary ext4 90M 110M \
  mkpart primary ext4 110M 100% \
  set 1 boot on

echo `ls -al /dev/vda*`

mkfs.ext4 /dev/vda1
mkfs.ext4 /dev/vda2
mkfs.ext4 /dev/vda3

if [ ! -d /mnt/vda1 ]; then
  mkdir /mnt/vda1
fi

mount /dev/vda1 /mnt/vda1

mkdir -p /mnt/vda1/boot/grub
mount /mnt/sr0

cp -p /mnt/sr0/boot/core.gz /mnt/sr0/boot/vmlinuz /mnt/vda1/boot/

cat <<'EOF' > /mnt/vda1/boot/grub/grub.cfg
set timeout=2
set default=0
menuentry "tinylinux-7" {
  linux /boot/vmlinuz quiet waitusb=5 tce=vda1 opt=vda2 home=vda3
  initrd /boot/core.gz
}
EOF

/usr/local/sbin/grub-install --no-floppy --root-directory=/mnt/vda1 /dev/vda

# mount vda3 so that we can install the vagrant ssh home directory in
# this partition for persistence.
if [ ! -d /mnt/vda3 ]; then
  mkdir /mnt/vda3
fi

mount /dev/vda3 /mnt/vda3
