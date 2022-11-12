#!/bin/bash

# uncomment deb-src in /etc/apt/sources.list
sudo apt-get update
# Ubuntu

# https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel
sudo apt-get build-dep linux linux-image-$(uname -r)

sudo apt-get install libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf llvm
sudo apt-get install git

# install fakeroot
sudo apt-get install fakeroot clang


## https://elixir.bootlin.com/linux/v5.15/source/samples/bpf/README.rst
# in linux kernel root directory
make -C tools clean
make -C samples/bpf clean
make clean

make headers_install
make VMLINUX_BTF=/sys/kernel/btf/vmlinux -C samples/bpf




 