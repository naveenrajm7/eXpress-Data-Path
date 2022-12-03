# Packet Drop Performance


Start with combined 1 do xdp , L with 1 stream 
            then 2 xdp , L              2 stream
            then 3 xdp , L 

                 6 xdp ,                6 till 12 stream

```bash
# scale rxqs
sudo ethtool -L ens6 combined X
# distribute among rxq
sudo ethtool -X ens6 equal X
```

**TRex command**

```bash
trex> start -f custom/udp_for_benchmarks.py --port 0 -d 60 -m 100mpps -t packet_len=64,stream_count=XX
```

## Linux

### iptables raw , Please check baseline 

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
sudo iptables -t raw -D PREROUTING -j DROP  
```

### iptables filter (with conntrack), Please check baseline

Add rule 
```bash
# paper
sudo iptables -t filter -I INPUT  -p udp --dport 9:19 --j DROP
sudo iptables -I INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# paper custom drop
sudo iptables -t filter -I FORWARD -p udp --dport 9:19  -j DROP
sudo iptables -I INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Old
sudo iptables -I FORWARD -d 48.0.0.1/32 -p udp --dport 12  -j DROP
```

Verify conntrack
```
sudo conntrack -L
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
# paper
sudo iptables -t filter -D INPUT  -p udp --dport 9:19 --j DROP
sudo iptables -D INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# custom drop
sudo iptables -t filter -D FORWARD -p udp --dport 9:19  -j DROP
sudo iptables -D INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT


# working og
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



            1       2       3       4       5       6
XDP
L(raw)
L(con)