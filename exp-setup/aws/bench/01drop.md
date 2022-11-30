# Packet Drop Performance


**TRex command**

```bash
trex> start -f stl/udp_for_benchmarks.py --port 0 -d 60 -m XXmpps -t packet_len=64,stream_count=XX
```

## Linux

### iptables raw

Add rule
```bash
sudo iptables --table raw --insert PREROUTING --jump DROP --in-interface ens6
```

> Remember to specify the interface (-i) , else all interface will be matched
> Since that also includes management interface , you might lose connection to machine

List rule
```bash
sudo iptables --table raw --list
```

Get packet count 
```bash
sudo iptables --table raw --list -v
```

Reset counter 
```bash
sudo iptables --table raw --list -Z
```

Use mmwatch tool by Cloudflare

```bash
mmwatch 'sudo iptables -t raw -L -v -n -x | head'
```

To remove rule
```bash
sudo iptables -t raw -D PREROUTING -j DROP -i ens6
```

### iptables filter (with conntrack)

Add rule 
```bash
sudo iptables -I FORWARD -d 48.0.0.1/32 -p udp --dport 12  -j DROP
```

Verify conntrack
```
vagrant@xdp-DUT:~$ sudo conntrack -L
conntrack v1.4.6 (conntrack-tools): 0 flow entries have been shown.
```

Get packet count 
```bash
sudo iptables  --list -v
```

Reset counter 
```bash
sudo iptables --list -Z
```

Use mmwatch tool by Cloudflare

```bash
mmwatch 'sudo iptables -L -v -n -x | head'
```

To remove rule
```bash
sudo iptables -D FORWARD -d 48.0.0.1/32 -p udp --dport 12  -j DROP
```

## XDP


```bash
sudo ./xdp_rxq_info --dev ens6 --action XDP_DROP
```



## Repeat 

**Redirect Traffic to N core**
```bash
sudo ethtool -L ens6 combined N
```

*N -> 1 to 6*