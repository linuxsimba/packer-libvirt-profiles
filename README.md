## My packer files for libvirt

## Requirements
* Install [Libvirt](http://libvirt.org)

##Download Packer

[Packer](http://www.packer.io/docs/builders/qemu.html) is for creating machine images from a single source configuration.

Packer ships in a zip package that contains binary files. Example of how
download packer and update the executable path search location.

```
mkdir $HOME/packer
cd $HOME/packer
wget https://dl.bintray.com/mitchellh/packer/packer_0.8.5_linux_amd64.zip
unzip packer_0.8_5_linux_amd64.zip
export PATH=$HOME/packer:$PATH
```


### Ubuntu , Debian, Centos

Got straight out the [chef/bento](http://github.com/chef/bento) project. Removed
all providers except QEMU.

### Mirantis 7.0

Attempt to build vagrant box for mirantis Fuel master node. Used centos-6 packer
template from [chef/bento](http://github.com/chef/bento) project as a template.

The final vagrant box does not have the docker containers necessary for Fuel to
work. This was done to conserve disk size. When ``vagrant up`` is issued. A
provisioner script executes to create the docker containers and causes the VM
size to grow significantly.

To build, run the following:
```
mkdir -p $HOME/tmp/openstack
export TMPDIR=$HOME/tmp/openstack
packer build mirantis-7.x86_64.json
```

The reason for defining the TMPDIR is because without this you get a
``post-processor failure: ran of a disk space`` message. By default packer uses
the ``/tmp`` directory which in my case is a RAMFS partition with only 4GB.

In the ``vagrantfile-example`` directory there is a sample VagrantFile for
running the master node.

> Note: this vagrant box is only for libvirt. Will build a Virtualbox version at
> some later stage. I use the libvirt provider more often than the Virtualbox
> provider. But I know most people use the Virtualbox provider. If someone wants
> to build that and issue a Pull Request, I will gladly accept it.

### Tinycore Linux

To build the ISO required to use with this packer script, go to the linuxsimba fork
of the [tinycorelinux-packer-image repo](https://github.com/linuxsimba/tinycorelinux-packer-image)

Copy the iso to the ``$HOME/openstack`` directory. If you wish to put in a
different directory, modify the ``mirror_directory`` variable in the tinycore
linux packer json file.
