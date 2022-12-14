# Packet Drop Performance


**TRex command**

```bash
trex> start -f stl/udp_for_benchmarks.py --port 0 -d 60 -m 1mpps -t packet_len=64,stream_count=XX
```

>trex duration works if small amount of packets per second is choosen
>if more packets like 1.48 mmpps (max in setup) since trex is not able to send that much, the job wont stop in given time duration. It will only stop after the required rate is achived for that duration

## Linux

### iptables raw

Add rule
```bash
sudo iptables --table raw --insert PREROUTING --jump DROP --in-interface eth1
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

** Run tRex for 60 seconds, get the packet count and divide by 60 to get drop rate in pps ** ??

Use mmwatch tool by Cloudflare

```bash
mmwatch 'sudo iptables -t raw -L -v -n -x | head'
```

To remove rule
```bash
sudo iptables -t raw -D PREROUTING -j DROP -i eth1
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
sudo ./xdp_rxq_info --dev eth1 --skb-mode --action XDP_DROP
```


## Results

| Method \ Core     | 1       | 2        | 3       |
|-------------------|---------|----------|---------|
| Linux (raw)       | 78400   | rrrrrrrr | rrrrrrr |
| Linux (conntrack) | 74900   | cccccccc | ccccccc |
| XDP               | 81635   | xxxxxxx  | xxxxxxx |
