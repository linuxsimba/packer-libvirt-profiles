#!/bin/sh -eux

# Lab specific tools.
apt-get -y update
apt-get install bridge-utils vlan ifenslave python-pip
pip install netshow-linux-lib
