
# Packet Forwading Performance

Similar to packet drop

**TRex command**

Start Trex for 60 sec , after 10 secs attach xdp_redirect , quit after 30 secs . Capture average stats 

```bash
trex> start -f stl/udp_for_benchmarks.py --port 0 -m XXpps -d 60  -t packet_len=64,stream_count=1
```



## XDP

*Make sure both IN and OUT Interface have same RXQ
sudo ethtool -L <interface> combined 1

Different NIC

```bash
sudo ./xdp_redirect ens6 ens7 -s 
```

Same NIC

```bash
sudo ./xdp_rxq_info --dev ens6 --action XDP_TX
```

## Repeat 

**Redirect Traffic to N core**
```bash
sudo ethtool -L ens6 combined N
sudo ethtool -L ens7 combined N

```

*N -> 1 to 6*