# Inline DoS Mitigation

Steer all traffic to CPU 2 , using combined , --cpu and -t 

**TRex command**

```bash
trex>start -f stl/udp_for_benchmarks.py --port 0 -m XXpps -t packet_len=64,stream_count=1
```

## Setup 


DUT is running netserver 
Generator T-rex is attacking with UDP packets 
Another machine is a client running netperf 

All machines are connected to same 100G switch

## Commands

Make sure DDoS attack is hitting same RXQ on NIC, by reducing NIC RXQ number to 1,  On DUT
```
ethtool -L ens6 combined 1
```

Netperf client, On Device other than DUT
```bash
netperf -t TCP_RR -H 198.18.1.10 -D1 -l 60 -T X,X
```
use Host 198.18.1.10 , Display every 1 sec , Length 60 secs , Bind to local CPU, remote CPUß

XDP DDOS filter program
```bash
sudo ./xdp_redirect_cpu --dev ens06 --progname xdp_prognum4_ddos_filter_pktgen --cpu X --stats
```

## Baseline

**Without DDOS, without XDP**

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D1  -T1,1

```


**Without DDOS, with XDP**

XDP DDOS filter program
```bash
sudo ./xdp_redirect_cpu --dev ens6 --progname xdp_prognum4_ddos_filter_pktgen --cpu 2
```

```
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D1  -T1,1

```

**With DDOS, without XDP**

DDOS 100kpps
```bash
trex>start -f stl/udp_for_benchmarks.py --port 0 -m 100kpps -t packet_len=64,stream_count=1
```

```
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D1  -T1,1

```

**With DDOS, with XDP**

DDOS 100kpps
```bash
trex>start -f stl/udp_for_benchmarks.py --port 0 -m 100kpps -t packet_len=64,stream_count=1
```

XDP DDOS filter program
```bash
sudo ./xdp_redirect_cpu --dev ens6 --progname xdp_prognum4_ddos_filter_pktgen --cpu 1  
```

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
```

## DoS Protection




## No DoS Protection










