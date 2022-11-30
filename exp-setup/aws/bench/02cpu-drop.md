# CPU Usage


**TRex command**

```bash
trex> start -f stl/udp_for_benchmarks.py --port 0 -m XXkpps -t packet_len=64,stream_count=1
```

**Turn off CPU1**
```bash
echo 0 > /sys/devices/system/cpu/cpu1/online
```
> Never turn off cpu0!

**Redirect Traffic to single core**
```bash
sudo ethtool -L ens6 combined 1
```

**mpstat command**
```mpstat```

```bash
 mpstat -u -I SUM -P ALL 10 3
```

## Linux

```bash
sudo iptables --table raw --insert PREROUTING --jump DROP --in-interface ens6
```

## XDP


```bash
sudo ./xdp_rxq_info --dev ens6 --action XDP_DROP
```

