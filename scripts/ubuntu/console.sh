#!/bin/sh -eux

# Add Console Support to the Ubuntu image

ubuntu_version="`lsb_release -r | awk '{print $2}'`";
ubuntu_major_version="`echo $ubuntu_version | awk -F. '{print $1}'`";

# Work around bad cached lists on Ubuntu 12.04
#if [ "$ubuntu_version" = "12.04" ]; then
#    apt-get clean;
#    rm -rf /var/lib/apt/lists;
#fi

cat <<EOF >/etc/init/ttyS0.conf
start on stopped rc RUNLEVEL=[12345]
stop on runlevel [!12345]

respawn
exec /sbin/getty -L 115200 ttyS0 vt102
EOF

current_line='GRUB_CMDLINE_LINUX='
modified_line='GRUB_CMDLINE_LINUX="console=tty0 console=ttyS0, 115200n8"'
sed -i "s/^$current_line/$modified_line/" /etc/default/grub
