
# Packet Forwading Performance

Similar to packet drop

**TRex command**

```bash
trex> start -f stl/udp_for_benchmarks.py --port 0 -m 1mpps -t packet_len=64,stream_count=XX
```

## XDP

Same NIC / and Different NIC

// TODO validate the working of below command
```bash
sudo ./xdp_rxq_info --dev ens6 --action XDP_REDIRECT
```

You can use XDP_TX to forward packets using the same NIC by which it was received
You can use XDP_REDIRECT to forward packets to a different network interface