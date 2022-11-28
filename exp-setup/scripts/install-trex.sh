#!/bin/bash

# run as root

# set hostname
hostname ${host_name}

# get make (aws)
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y make

# Install module for trex
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y linux-headers-`uname -r` build-essential

# create trex dir
mkdir -p /opt/trex
cd /opt/trex 

# get latest trex
wget --no-cache --no-check-certificate https://trex-tgn.cisco.com/trex/release/latest

# extract trex
tar -zxvf latest 