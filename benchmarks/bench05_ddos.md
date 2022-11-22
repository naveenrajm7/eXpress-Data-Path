# Inline DoS Mitigation

**TRex command**

```bash
start -f /home/jbrouer/git/xdp-paper/benchmarks/udp_for_benchmarks02.py -t packet_len=64,stream_count=1 --port 0 -m 2900kpps
```

## Setup 


DUT is running netserver 
Generator T-rex is attacking with UDP packets 
Another machine is a client running netperf 

All machines are connected to same 100G switch


## DoS Protection



## No DoS Protection






## Resource

https://www.jtouzi.net/measuring-network-throughput-netperf-iperf/
