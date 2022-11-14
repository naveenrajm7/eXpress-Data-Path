# CPU Usage


**TRex command**

```bash
trex> start -f stl/udp_for_benchmarks.py --port 0 -m XXkpps -t packet_len=64,stream_count=1
```

**Turn off CPU**
```bash
echo 0 > /sys/devices/system/cpu/cpu1/online
```

> Never turn off cpu0!

**mpstat command**
```mpstat```

```bash
 mpstat -u -I SUM -P ALL 10 6
```

## Linux

```bash
sudo iptables --table raw --insert PREROUTING --jump DROP --in-interface eth1
```

## XDP


```bash
sudo ./xdp_rxq_info --dev eth1 --skb-mode --action XDP_DROP
```



## Results


| Load  | Linux | XDP |
|-------|-------|-----|
| 10    | xxx   | rrr |
| 20    | xxx   | rrr |
| 30    | xxx   | rrr |
| 40    |       |     |
| 50    |       |     |
| 60    |       |     |
| 70    |       |     |
| 80    |       |     |
| 90    |       |     |
| 100   |       |     |



