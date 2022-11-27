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