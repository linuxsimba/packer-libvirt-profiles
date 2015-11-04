# packer-libvirt-profiles

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

## Build a  Libvirt Compatible Box.

```
git clone https://github.com/skamithi/packer-libvirt-profiles
cd packer-libvirt-profiles
packer debian-8.1-amd64.json
```
