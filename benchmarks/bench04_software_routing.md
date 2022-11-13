# Software Routing

**TRex command**

```bash
trex> start -f stl/udp_multi_ip.py -t packet_len=64,stream_count=20000,port_count=1 --port 0 -m 100%
```


## Linux

configure next hop address to address of the test system connected to our egress interface

// TODO find ip route entry to pass packet out of egress interface
```bash
ip route <>
```

## XDP

//TODO validate below command

```bash
./xdp_fwd -D eth1
```