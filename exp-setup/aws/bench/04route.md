# Software Routing

Delete previous routes

Need
ethtool_stats.pl  read_route_table.sh  setup_rxqueues.sh


**TRex command**

```bash
trex> start -f udp_multi_ip.py --port 0 -m 24mpps -t packet_len=64,stream_count=2,port_count=1 
```

## Linux

Route everything through more specific route trick:

<!-- sudo ip r add 0.0.0.0/1   via 198.18.2.11 --> Dangerous
sudo ip r add 128.0.0.0/8 via 198.18.2.11




## XDP


```bash
sudo ./xdp_fwd -D ens6 ens7
```

remove
```
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
xzcat all-bgp-routes-20180419.txt.xz | sudo ./read_route_table.sh 198.18.2.11
$ ip r | wc -l
752147
```

