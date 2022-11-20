# Software Routing

**TRex command**

```bash
trex> start -f stl/udp_multi_ip.py -t packet_len=64,stream_count=20000,port_count=1 --port 0 -m 100%
```


```
vagrant@xdp-DUT:~/linux-5.15.0/samples/bpf$ ip route show
default via 10.0.2.2 dev eth0 proto dhcp src 10.0.2.15 metric 100 
10.0.2.0/24 dev eth0 proto kernel scope link src 10.0.2.15 metric 100 
10.0.2.2 dev eth0 proto dhcp scope link src 10.0.2.15 metric 100 
10.0.2.3 dev eth0 proto dhcp scope link src 10.0.2.15 metric 100 
192.168.56.0/24 dev eth3 proto kernel scope link src 192.168.56.107 
192.168.253.0/24 dev eth1 proto kernel scope link src 192.168.253.107 
192.168.254.0/24 dev eth2 proto kernel scope link src 192.168.254.107 
```

```
vagrant@xdp-DUT:~/linux-5.15.0/samples/bpf$ sudo ip neigh show
10.0.2.2 dev eth0 lladdr 52:54:00:12:35:02 REACHABLE
10.0.2.3 dev eth0 lladdr 52:54:00:12:35:03 STALE
192.168.253.106 dev eth1 lladdr 08:00:27:11:22:01 STALE
192.168.254.106 dev eth2 lladdr 08:00:27:11:22:02 STALE
```

## Linux

configure next hop address to address of the test system connected to our egress interface

// TODO find ip route entry to pass packet out of egress interface
```bash
ip route <>
```

## XDP

Setup fake “next-hop” gateway via a fake ARP/neigh entry.

```
sudo ip neigh replace 192.168.254.106 dev eth2 lladdr 08:00:27:11:22:02
```

Ingress device is: eth1

192.168.253.0/24 dev eth1 proto kernel scope link src 192.168.253.107

Engress device is: eth2

192.168.254.0/24 dev eth2 proto kernel scope link src 192.168.254.107

Route everything through more specific route trick:

```
sudo ip r add 0.0.0.0/1   via 192.168.254.106
sudo ip r add 128.0.0.0/1 via 192.168.254.106
```


```bash
sudo ./xdp_fwd -D eth1 eth2 -S 
```