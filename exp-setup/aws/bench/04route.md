# Software Routing

**Set user password to enter instance using Console port**
**bad route might disconnect you from instance**

** Set next-hopt address to the address of the system connected to egress interface **

*Single Core* . 
    * Singe Route - stream_count = 1
    * Full Table Route - stream_count = 4000


**TRex command**

For this script the stream_count parameter sets the number of dest IPs, and port_count sets the number of dest UDP ports

```bash
trex> start -f /home/ubuntu/xdp_scripts/udp_multi_ip.py --port 0 -m 100% -t packet_len=64,stream_count=XX,port_count=1 
```


<!-- sudo ip r add 128.0.0.0/8 via 198.18.2.11
sudo ip r del 128.0.0.0/8 via 198.18.2.11 -->



## Setup

Single queue performance
```
ethtool -L ens6 combined 1
```

Setup fake “next-hop” gateway via a fake ARP/neigh entry.

```bash
sudo ip neigh replace 198.18.2.66 dev ens7 lladdr 00:11:22:33:00:66
```

Ingress device is: ens6

198.18.1.0/24 dev ens6 proto kernel scope link src 198.18.1.10 

Engress device is: ens7

198.18.2.0/24 dev ens7 proto kernel scope link src 198.18.2.10 

Route everything through more specific route trick:

```bash
# carefull before doing , you'll lose connection
sudo ip r add 0.0.0.0/1   via 198.18.2.66
sudo ip r add 128.0.0.0/1 via 198.18.2.66
```

```bash
sudo ip r add 0.0.0.0/1   via 198.18.2.66
# modified
sudo ip r add 128.0.0.0/8 via 198.18.2.66
```

**Install full route table**

xzcat all-bgp-routes-20180419.txt.xz | sudo ./read_route_table.sh 198.18.2.66



remove route
```
sudo ip r del 0.0.0.0/1   via 198.18.2.66
sudo ip r del 128.0.0.0/1 via 198.18.2.66
```

## Linux

Measure without XDP
Throughput is measure by ethtool on the TX interface (ens7)

*Measure throughput with ethtool_stats.pl tx_packets /sec Ethtool*

```bash
sudo ./ethtool_stats.pl --dev en6 --dev ens7
# see for stats tx_packets /sec Ethtool(ens3f1 )
```

## XDP


Attach 
```bash
sudo ./xdp_fwd -D ens6 ens7
```

*Measure throughput with ethtool_stats.pl (rx_xdp_redirect /sec)*


remove xdp
```
sudo ip link set dev ens6 xdp off
sudo ip link set dev ens7 xdp off
```

## Measuring 
Measure throughput with ethtool_stats.pl

Use ethtool_stats.pl
https://github.com/netoptimizer/network-testing/blob/master/bin/ethtool_stats.pl



## Repeat

**Installing full route table**
```
wget https://kau.toke.dk/xdp/all-bgp-routes-20180419.txt.xz
xzcat all-bgp-routes-20180419.txt.xz | sudo ./read_route_table.sh 198.18.2.66
$ ip r | wc -l
752147
```

