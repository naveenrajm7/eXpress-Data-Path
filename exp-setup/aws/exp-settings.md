


## tRex

**Configure Interface**
```bash
sudo ./dpdk_setup_ports.py -i
```

```yaml
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

```
cd /usr/lib/x86_64-linux-gnu/
ln -s -f libc.a liblibc.a
```

Launch the TRex server in Stateless mode:

```bash
cd v3.XX
vagrant@tRex:/opt/trex/v3.00$ sudo ./t-rex-64 -i
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
ip link set dev <interface> mtu 3498
# Number of RX/TX queues must be half the available channels, make just 1 for 1 CPU. 2 for 2 CPU
# Must be half of number of CPU fpr this to work
ethtool -L <interface> combined 1
```

