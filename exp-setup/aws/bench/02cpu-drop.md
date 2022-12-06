# CPU Usage


Run each trex command for 60 seconds with values 
500kpps, 1mpps, 2mpps, 3mpps, 4mpps, 5mpps, 10mpps, 15mpps, 20mpps, 25mpps

Run mpstat for 30 seconds capture summary


**TRex command**

```bash
trex> start -f stl/udp_for_benchmarks.py --port 0 -m XXpps -t packet_len=64,stream_count=1
```

**Turn off CPU1**
```bash
echo 0 > /sys/devices/system/cpu/cpu1/online
```
> Never turn off cpu0!

OR
**Redirect Traffic to single core**
```bash
# enable 1 rx-queue per NIC
sudo ethtool -L ens6 combined 1
```

```bash
# Need , redirect traffic to particular rx-queue , hence particular CPU
sudo ethtool -X ens6 equal 1
```

**mpstat command**
```mpstat```

```bash
# Measure for 10 seconds , 3 times , report average
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

