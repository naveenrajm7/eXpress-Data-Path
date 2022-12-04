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


Netperf client
```bash
netperf -t TCP_RR -H 198.18.1.10 -D1 -l 60 -T 2,2
```
use Host 198.18.1.1 , Display every 1 sec , Length 60 secs , Bind to local CPU, remote CPUß

XDP DDOS filter program
```bash
sudo ./xdp_redirect_cpu --dev eth1 --progname xdp_prognum4_ddos_filter_pktgen --cpu 1 --skb-mode
```

## Baseline

**Without DDOS, without XDP**

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D1  -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 78588.14 Trans/s over 1.000 seconds ending at 1670184387.827
Interim result: 77947.05 Trans/s over 1.008 seconds ending at 1670184388.835
Interim result: 78584.14 Trans/s over 1.000 seconds ending at 1670184389.835
Interim result: 76611.03 Trans/s over 1.026 seconds ending at 1670184390.861
Interim result: 78990.97 Trans/s over 1.000 seconds ending at 1670184391.861
Interim result: 78006.71 Trans/s over 1.013 seconds ending at 1670184392.873
Interim result: 72925.68 Trans/s over 1.070 seconds ending at 1670184393.943
Interim result: 69511.46 Trans/s over 1.049 seconds ending at 1670184394.992
Interim result: 78342.84 Trans/s over 1.000 seconds ending at 1670184395.992
Interim result: 76745.84 Trans/s over 0.835 seconds ending at 1670184396.827
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       10.00    76564.23   
16384  131072
```


**Without DDOS, with XDP**

XDP DDOS filter program
```bash
sudo ./xdp_redirect_cpu --dev eth1 --progname xdp_prognum4_ddos_filter_pktgen --cpu 1 --skb-mode
```

```
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D1  -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 77914.38 Trans/s over 1.000 seconds ending at 1670184621.004
Interim result: 78825.37 Trans/s over 1.000 seconds ending at 1670184622.004
Interim result: 61379.14 Trans/s over 1.284 seconds ending at 1670184623.288
Interim result: 78907.84 Trans/s over 1.000 seconds ending at 1670184624.288
Interim result: 76846.52 Trans/s over 1.027 seconds ending at 1670184625.315
Interim result: 78742.53 Trans/s over 1.001 seconds ending at 1670184626.316
Interim result: 79208.52 Trans/s over 1.000 seconds ending at 1670184627.316
Interim result: 78750.77 Trans/s over 1.006 seconds ending at 1670184628.321
Interim result: 77879.91 Trans/s over 1.011 seconds ending at 1670184629.333
Interim result: 72683.12 Trans/s over 0.672 seconds ending at 1670184630.004
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       10.00    75812.47   
16384  131072
```

**With DDOS, without XDP**

DDOS 100kpps
```bash
trex>start -f stl/udp_for_benchmarks.py --port 0 -m 100kpps -t packet_len=64,stream_count=1
```

```
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D1  -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 26403.08 Trans/s over 1.475 seconds ending at 1670184803.069
Interim result: 33328.93 Trans/s over 1.000 seconds ending at 1670184804.069
Interim result: 30454.02 Trans/s over 1.094 seconds ending at 1670184805.164
Interim result: 32720.89 Trans/s over 1.000 seconds ending at 1670184806.164
Interim result: 27910.23 Trans/s over 1.172 seconds ending at 1670184807.336
Interim result: 35015.81 Trans/s over 1.008 seconds ending at 1670184808.344
Interim result: 32943.23 Trans/s over 1.063 seconds ending at 1670184809.407
Interim result: 33130.05 Trans/s over 1.016 seconds ending at 1670184810.423
Interim result: 30995.81 Trans/s over 1.069 seconds ending at 1670184811.492
Interim result: 30631.49 Trans/s over 0.107 seconds ending at 1670184811.598
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       10.00    31127.82   
16384  131072
```

**With DDOS, with XDP**

DDOS 100kpps
```bash
trex>start -f stl/udp_for_benchmarks.py --port 0 -m 100kpps -t packet_len=64,stream_count=1
```

XDP DDOS filter program
```bash
sudo ./xdp_redirect_cpu --dev eth1 --progname xdp_prognum4_ddos_filter_pktgen --cpu 1 --skb-mode
...
Summary                    81,506 rx/s            163,012 err,drop/s   
  receive                  81,506 pkt/s                 0 drop/s           81,506 error/s      
  xdp_exception total      81,506 hit/s        
    XDP_ABORTED            81,506 error/s      
Summary                    82,064 rx/s            164,128 err,drop/s   
  receive                  82,064 pkt/s                 0 drop/s           82,064 error/s      
  xdp_exception total      82,064 hit/s        
    XDP_ABORTED            82,064 error/s      
```

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D1  -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 40897.91 Trans/s over 1.099 seconds ending at 1670184984.519
Interim result: 42639.61 Trans/s over 1.004 seconds ending at 1670184985.522
Interim result: 42085.02 Trans/s over 1.013 seconds ending at 1670184986.536
Interim result: 42941.26 Trans/s over 1.000 seconds ending at 1670184987.536
Interim result: 40823.80 Trans/s over 1.052 seconds ending at 1670184988.588
Interim result: 41114.88 Trans/s over 1.000 seconds ending at 1670184989.588
Interim result: 41531.13 Trans/s over 1.000 seconds ending at 1670184990.588
Interim result: 42674.87 Trans/s over 1.000 seconds ending at 1670184991.588
Interim result: 42573.91 Trans/s over 1.002 seconds ending at 1670184992.590
Interim result: 43995.13 Trans/s over 0.829 seconds ending at 1670184993.419
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       10.00    42076.35
```

## DoS Protection




## No DoS Protection



