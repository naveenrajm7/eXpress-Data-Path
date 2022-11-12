
*** Use minimum sized (64 bytes) packets**
Q: Will a packet size test make sense?
Since we are already saturating the PCI bus I don’t think this is needed.
Packets size doesn't matter

*packet_len=64*
```
start -f stl/udp_for_benchmarks.py -t packet_len=64 --port 0 -m 100%
```

*** Disable hyper threading**
echo 0 > /sys/devices/system/cpu/<cpu_id>/online
https://www.golinuxhub.com/2018/05/how-to-disable-or-enable-hyper/

*control how many cpus are online*

*** Configure Hardware Receive Side Scaling(RSS)**
The map changes dynamically according to the CPU bitmask to /sys/class/net/<dev>/queues/rx-<n>/rps_cpus. For example, if we want to make the queue use the first 3 CPUs in a 8 CPUs system, we first construct the bitmask, 0 0 0 0 0 1 1 1, to 0x7, and

    # echo 7 > /sys/class/net/eth0/queues/rx-0/rps_cpus

https://garycplin.blogspot.com/2017/06/linux-network-scaling-receives-packets.html

- https://github.com/Netronome/bpf-samples/tree/master/programmable_rss


*control how many cpus process packets for a given interface*

**Ethernet flow control**

**Recieve Queue size**



## Setup 

### Kernel sample programs

Ubuntu 22.04
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

## tRex


## Building 

XDP paper uses kernel BPF samples from kernel source to run tests

XDP Project uses libbpf and custom programs to run

https://nakryiko.com/posts/libbpf-bootstrap/ 

Use kernel programs 

https://elixir.bootlin.com/linux/v5.15/source/samples/bpf/README.rst
https://patchwork.kernel.org/project/netdevbpf/patch/20210928054608.1799021-1-memxor@gmail.com/#24478279


### XDP native not supported 
```
vagrant@xdp-DUT:~/linux-5.15.0/samples/bpf$ sudo ./xdp1 eth0
libbpf: Kernel error message: Underlying driver does not support XDP in native mode
link set xdp fd failed
```

https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md#xdp

```bash
vagrant@xdp-DUT:~/linux-5.15.0$ sudo lspci -v | grep -A9 'Ethernet' 
00:03.0 Ethernet controller: Intel Corporation 82540EM Gigabit Ethernet Controller (rev 02)
	Subsystem: Intel Corporation PRO/1000 MT Desktop Adapter
	Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 19
	Memory at f0000000 (32-bit, non-prefetchable) [size=128K]
	I/O ports at d010 [size=8]
	Capabilities: [dc] Power Management version 2
	Capabilities: [e4] PCI-X non-bridge device
	Kernel driver in use: e1000
	Kernel modules: e1000
```

## DROP Test

+-----------------------------+                          +-----------------------------+
| Root namespace              |                          | Testenv namespace 'test01'  |
|                             |      From 'test01'       |                             |
|                    +--------+ TX->                RX-> +--------+                    |
|                    | test01 +--------------------------+  veth0 |                    |
|                    +--------+ <-RX                <-TX +--------+                    |
|                             |       From 'veth0'       |                             |
+-----------------------------+                          +-----------------------------+

DUT                                                       Traffic generator

```bash
vagrant@xdp-DUT:~/linux-5.15.0/samples/bpf$ sudo ./xdp1 xdptut-6937
proto 58:          0 pkt/s
proto 58:          1 pkt/s
proto 58:          1 pkt/s
proto 58:          1 pkt/s
```

**Linux(raw)**
iptables -t raw -j DROP

**Test parameter exceeds line rate**
```bash
trex>start -f stl/udp_for_benchmarks.py --port 0 -m 100mpps -t packet_len=64,stream_count=1

Removing all streams from port(s) [0._]:                     [SUCCESS]


Attaching 1 streams to port(s) [0._]:                        [SUCCESS]


Starting traffic on port(s) [0._]:                           [FAILED]


start - Port 0 : *** Expected L1 B/W: '67.2 Gbps' exceeds port line rate: '1 Gbps'
trex>start -f stl/udp_for_benchmarks.py --port 0 -m 10mpps -t packet_len=64,stream_count=1

Removing all streams from port(s) [0._]:                     [SUCCESS]


Attaching 1 streams to port(s) [0._]:                        [SUCCESS]


Starting traffic on port(s) [0._]:                           [FAILED]


start - Port 0 : *** Expected L1 B/W: '6.72 Gbps' exceeds port line rate: '1 Gbps'

```


** DROP Test - 1 mpps **
```bash
trex>start -f stl/udp_for_benchmarks.py --port 0 -m 1mpps -t packet_len=64,stream_count=1

Removing all streams from port(s) [0._]:                     [SUCCESS]


Attaching 1 streams to port(s) [0._]:                        [SUCCESS]


Starting traffic on port(s) [0._]:                           [SUCCESS]

22.79 [ms]

trex>streams
Port 0:

    ID     |      name       |     profile     |     packet type     |  length  |       mode       |      rate       |    PG ID     |     next     
-----------+-----------------+-----------------+---------------------+----------+------------------+-----------------+--------------+-------------
    4      |        -        |        _        | Ethernet:IP:UDP:Raw |       64 |    Continuous    |      1 pps      |      -       |      -       

```


DROP Test
```bash
# TRex server

sudo ./t-rex-64 -i  # start t-rex server in stateless mode

# TRex console

./trex-console
trex> start -f stl/udp_for_benchmarks.py --port 0 -m 1mpps -t packet_len=64,stream_count=1
trex>streams
Port 0:

    ID     |      name       |     profile     |     packet type     |  length  |       mode       |      rate       |    PG ID     |     next     
-----------+-----------------+-----------------+---------------------+----------+------------------+-----------------+--------------+-------------
    5      |        -        |        _        | Ethernet:IP:UDP:Raw |       64 |    Continuous    |      1 pps      |      -       |      -       

trex>stop

Stopping traffic on port(s) [0._]:                           [SUCCESS]

6.29 [ms]

trex>clear

Clearing stats :                                             [SUCCESS]

7.23 [ms]

trex>stats


# XDP DUT
Running XDP on dev:eth1 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       81681       0          
XDP-RX CPU      total   81681      

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   81681       0          
rx_queue_index    0:sum 81681      
```