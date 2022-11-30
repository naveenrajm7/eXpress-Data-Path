# Software Routing

**TRex command**

```bash
trex> start -f stl/udp_multi_ip.py -t packet_len=64,stream_count=20000,port_count=1 --port 0 -m 100%
```

## Linux

Route everything through more specific route trick:

ip r add 0.0.0.0/1   via 198.18.2.11
ip r add 128.0.0.0/1 via 198.18.2.11


## XDP


```bash
sudo ./xdp_fwd -D ens6 ens7 -S 
```

Verify

Starting xdp_fwd program
sudo ./xdp_fwd -D mlx5p1 mlx5p2 i40e1


## Measuring 
Measure throughput with ethtool_stats.pl

Use ethtool_stats.pl
https://github.com/netoptimizer/network-testing/blob/master/bin/ethtool_stats.pl


## Repeat

**Installing full route table**
```
wget https://kau.toke.dk/xdp/all-bgp-routes-20180419.txt.xz
xzcat all-bgp-routes-20180419.txt.xz | sudo ./read_route_table.sh 198.18.100.66
$ ip r | wc -l
752147
```

