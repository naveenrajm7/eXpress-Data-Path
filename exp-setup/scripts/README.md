
# Setup Scripts



## tRex

Ubuntu 22.04 bento vagrant box

```bash
# run as root
# create trex dir
mkdir -p /opt/trex
cd /opt/trex 

# get latest trex
wget --no-cache --no-check-certificate https://trex-tgn.cisco.com/trex/release/latest

# extract trex
tar -zxvf latest 

# Test trex 
cd /v3.0.0
[bash]>sudo ./dpdk_setup_ports.py -s

```


## XDP DUT

Ubuntu 22.04 bento vagrant box
```bash
sudo vim /etc/apt/sources.list
# uncomment deb-src of jammy main restricted & jammy-updates main restricted
sudo sed -i '/jammy main restricted/s/^#//g' /etc/apt/sources.list
sudo sed -i '/jammy-updates main restricted/s/^#//g' /etc/apt/sources.list

sudo apt-get update

# kernel build dependencies
sudo DEBIAN_FRONTEND=noninteractive apt-get build-dep -y linux linux-image-$(uname -r)

# get all dependecies
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf llvm

# get fakeroot
sudo DEBIAN_FRONTEND=noninteractive apt install -y  fakeroot

# get linux sources
apt-get source -y linux-image-unsigned-$(uname -r)

# inside kernel source
cd linux-5.15.0

# modifying kernel config part, https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel
chmod a+x debian/rules
chmod a+x debian/scripts/*
chmod a+x debian/scripts/misc/*
LANG=C fakeroot debian/rules clean
LANG=C fakeroot debian/rules editconfigs # you need to go through each (Y, Exit, Y, Exit..) or get a complaint about config later

# https://elixir.bootlin.com/linux/v5.15/source/samples/bpf/README.rst
# compile bpf samples
sudo DEBIAN_FRONTEND=noninteractive apt install -y clang
make oldconfig && make prepare
make headers_install
make VMLINUX_BTF=/sys/kernel/btf/vmlinux -C samples/bpf
```

