
# Packet Forwading Performance

Fixed : 100mpps
Vary : 
     stream_count - 1 to 6
     -L, -X  - 1 to 6

Do Same NIC & Different NIC

Fix cores, and keep varying X -> 1 to N
```bash
# scale rxqs
sudo ethtool -L ens6 combined X
# distribute among rxq
sudo ethtool -X ens6 equal X
```

**TRex command**

```bash
trex> start -f /home/ubuntu/xdp_scripts/udp_for_benchmarks.py --port 0 -m 100mpps -t packet_len=64,stream_count=XX
```


## NICs settings

*Make sure both IN and OUT Interface have same RXQ*
sudo ethtool -L <interface> combined X

*Make sure both IN and OUT Interface have same distribution*
sudo ethtool -X <interface> equal X

## Different NIC

```bash
sudo ./xdp_redirect ens6 ens7 -s 
```

*Use ethtool_stats.pl to get xdp packets count at tx port , tx_packets /sec*

```bash
sudo ./ethtool_stats.pl --dev en6 --dev ens7
# see for stats tx_packets /sec Ethtool(ens3f1 )
```

## Same NIC

```bash
sudo ./xdp_rxq_info --dev ens6 --action XDP_TX
```

*xdp_rxq_info should print out packets processed*

## Repeat 

**Redirect Traffic to N core**
*N 1 to 6*
```bash
sudo ethtool -L ens6 combined N
sudo ethtool -L ens7 combined N

sudo ethtool -X ens6 equal N
sudo ethtool -X ens7 equal N
```