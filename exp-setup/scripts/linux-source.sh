#!/bin/bash

# set hostname
hostname ${host_name}

# https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel

# uncomment deb-src in /etc/apt/sources.list
sudo sed -i '/jammy main restricted/s/^#//g' /etc/apt/sources.list
sudo sed -i '/jammy-updates main restricted/s/^#//g' /etc/apt/sources.list

sudo apt-get update

# kernel build dependencies
sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep -y linux linux-image-$(uname -r)

# get all dependecies
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf llvm

# get fakeroot
sudo DEBIAN_FRONTEND=noninteractive apt install -y  fakeroot

# get clang
sudo DEBIAN_FRONTEND=noninteractive apt install -y clang

# get linux source code
sudo apt-get source -y linux-image-unsigned-$(uname -r)

# Interaction needed for below commands

# # inside kernel source directory 
cd ${linux_source_dir}

# modifying kernel config part, https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel
chmod a+x debian/rules
chmod a+x debian/scripts/*
chmod a+x debian/scripts/misc/*
LANG=C fakeroot debian/rules clean
# say no to edit configs
echo n | LANG=C fakeroot debian/rules editconfigs 

# # https://elixir.bootlin.com/linux/v5.15/source/samples/bpf/README.rst
# # compile bpf samples
make oldconfig && make prepare
make headers_install
make VMLINUX_BTF=/sys/kernel/btf/vmlinux -C samples/bpf




 