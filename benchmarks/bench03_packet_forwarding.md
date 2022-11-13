# Packet Forwading Performance

Similar to packet drop

**TRex command**

```bash
trex> start -f stl/udp_for_benchmarks.py --port 0 -m 1mpps -t packet_len=64,stream_count=XX
```


## Linux

>Linux Networking stack does not support this (forward packets out the same NIC and different NIC) minimal forwarding mode, but requires a full briding or routing lookup to forward packets; this lookup os expensive, and since the other application do not perform it. the results are not comparable. For this reason, we omit the Linux networking stack from these results.

## XDP

Ethernet address rewrite, source and destination address of the incoming packet are swapped before the packet is forwarded.

Same NIC / and Different NIC

// TODO validate the working of below command
```bash
sudo ./xdp_rxq_info --dev eth1 --skb-mode --action XDP_REDIRECT
```