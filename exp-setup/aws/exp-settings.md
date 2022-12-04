


## tRex


```
cd /usr/lib/x86_64-linux-gnu/
sudo ln -s -f libc.a liblibc.a
```

**Configure Interface**
```bash
sudo ./dpdk_setup_ports.py -i
```

```yaml /etc/trex_cfg.yaml
- version: 2
  interfaces: ['00:06.0', '00:07.0']
  port_info:
      - ip: 198.18.1.11
        default_gw: 198.18.1.10
      - ip: 198.18.2.11
        default_gw: 198.18.2.10

  platform:
      master_thread_id: 0
      latency_thread_id: 1
      dual_if:
        - socket: 0
          threads: [2,3]
```



Launch the TRex server in Stateless mode:

```bash
cd v3.XX
vagrant@tRex:/opt/trex/v3.00$ sudo ./t-rex-64 -c 6 -i 
```

Launch the TRex console

```bash
vagrant@tRex:/opt/trex/v3.00$ ./trex-console
```

Start traffic
```
trex> start -f stl/udp_for_benchmarks.py --port 0 -m 1mpps -t packet_len=64,stream_count=1
```



## DUT

sudo echo 1 > /proc/sys/net/ipv4/ip_forward
sudo route add -net 16.0.0.0 netmask 255.0.0.0 gw 198.18.1.11
sudo route add -net 48.0.0.0 netmask 255.0.0.0 gw 198.18.2.11


### XDP in ENI issue

```bash
# set MTU with in XDP prog limit
sudo ip link set dev ens6 mtu 3498
sudo ip link set dev ens7 mtu 3498
# Number of RX/TX queues must be half the available channels, make just 1 for 1 CPU. 2 for 2 CPU
# Must be half of number of CPU fpr this to work

# increases number of queue per interface (NIC device)
sudo ethtool -L ens6 combined X
sudo ethtool -L ens7 combined X

# To check RX queuses
sudo ethtool -l <interface>
```

```bash
Script to setup ethtool filter steering to RX-queue
# Not suppeorted in AWS ENI
ethtool -N $IFACE flow-type udp4 dst-port $port action $ring
ethtool -N ens6 flow-type udp4 dst-port 12 action 0

# try this
#  spread processing evenly between first 2 RX queues
sudo ethtool -X ens6 equal 2

# check effect 
sudo ethtool -x ens6

# Not able to steer packets . Maybe its too low for each cpu
# Try The big machine



# RPS (Recieve packet steering)
/sys/class/net/<device>/queues/<rx-queue>/rps_cpus
```


Eureka!!

Eureka1 : AWS ENI src/dest check
Eureka2 : Change port to change hash to change RX and hence change CPU which process the packets


NIC Speed reported by ENA
Same Issue : https://groups.google.com/g/trex-tgn/c/5yW_e73aVY4
Speed not reported : https://github.com/amzn/amzn-drivers/issues/61
Speed commit : https://github.com/amzn/amzn-drivers/commit/a485656091e2c826c55b2202f72a81ac435ba2e8#diff-dd54c4347e910470522e1c87845d0f6c99b387f8bfc660fec0ee8ca63614c1cc
Speed code : link->speed https://github.com/amzn/amzn-drivers/blob/master/kernel/linux/ena/ena_ethtool.c

ENA DPDK : https://doc.dpdk.org/guides/nics/ena.html
