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

To build run the following:
```
mkdir -p $HOME/tmp/openstack
export TMPDIR=$HOME/tmp/openstack
packer build mirantis-7.x86_64.json
```

The reason for defining the TMPDIR is because without this you get a
``post-processor failure: ran of a disk space`` message. By default packer uses
the ``/tmp`` directory which in my case is a RAMFS partition with only 4GB.
