#!/bin/sh -eux

# Add Console Support to the Centos image`


# add console=ttyS0 to the end of the grub config file
# First check to see if console=ttyS0 is configured first

if grep -q "console=ttyS0" /etc/sysconfig/grub; then
  echo "No Change to the Serial Console setting"
else
  echo "Apply Serial Console setting to the Centos Based VM"
  sed -e  '/GRUB_CMDLINE_LINUX/ s/.$//' -e '/GRUB_CMDLINE_LINUX/ s/$/ console=ttyS0"/' /etc/default/grub > /tmp/grub.tmp

  mv /tmp/grub.tmp /etc/default/grub
  # activate the change
  grub2-mkconfig -o /boot/grub2/grub.cfg
fi
