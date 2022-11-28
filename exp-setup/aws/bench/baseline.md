# Baseline speed

iperf3

```bash
ubuntu@tRex:/opt/trex/v3.00$ iperf3 -s -p 8001
[ 24]   0.00-60.01  sec   674 MBytes  94.2 Mbits/sec                  receiver
[SUM]   0.00-60.01  sec  6.70 GBytes   958 Mbits/sec                  receiver
-----------------------------------------------------------
Server listening on 8001
-----------------------------------------------------------
```

```bash
ubuntu@xdp-DUT:~/linux-aws-5.15.0$ iperf3 -c 10.0.1.37 -P 10 -i 1 -t 60 -V -p 8001
...
[SUM]   0.00-60.00  sec  6.70 GBytes   960 Mbits/sec  7769             sender
[SUM]   0.00-60.01  sec  6.70 GBytes   958 Mbits/sec                  receiver
CPU Utilization: local/sender 5.3% (0.3%u/5.0%s), remote/receiver 11.2% (2.0%u/9.1%s)
snd_tcp_congestion cubic
rcv_tcp_congestion cubic

iperf Done.
```

t2.micro 
TCP ~1Gbps

=====

c5n.xlarge

```bash
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[  8]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 10]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 12]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 14]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 16]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 18]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 20]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 22]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 24]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[SUM]   0.00-60.00  sec   146 GBytes  21.0 Gbits/sec                  receiver
```

```bash
Test Complete. Summary Results:
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec    0             sender
[  5]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[  7]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec    0             sender
[  7]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[  9]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec    0             sender
[  9]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 11]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec    0             sender
[ 11]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 13]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec    0             sender
[ 13]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 15]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec    0             sender
[ 15]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 17]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec    0             sender
[ 17]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 19]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec    0             sender
[ 19]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 21]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec    0             sender
[ 21]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[ 23]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec    0             sender
[ 23]   0.00-60.00  sec  14.6 GBytes  2.10 Gbits/sec                  receiver
[SUM]   0.00-60.00  sec   146 GBytes  21.0 Gbits/sec    0             sender
[SUM]   0.00-60.00  sec   146 GBytes  21.0 Gbits/sec                  receiver
CPU Utilization: local/sender 84.7% (2.8%u/81.9%s), remote/receiver 84.9% (1.1%u/83.8%s)
```




