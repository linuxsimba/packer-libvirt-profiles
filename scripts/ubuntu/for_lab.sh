#!/bin/sh -eux

# Lab specific tools.
apt-get -y update
apt-get -y install bridge-utils vlan ifenslave python-setuptools
easy_install pip
pip install netshow-linux-lib
