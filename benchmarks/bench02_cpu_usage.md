# CPU Usage


**TRex command**

```bash
trex> start -f stl/udp_for_benchmarks.py --port 0 -m XXmpps -t packet_len=64,stream_count=1
```


```mpstat```

## Linux

### iptables 

```bash
iptables -t raw -j DROP
```


## XDP


```bash
sudo ./xdp_rxq_info --dev eth1 --skb-mode --action XDP_DROP
```