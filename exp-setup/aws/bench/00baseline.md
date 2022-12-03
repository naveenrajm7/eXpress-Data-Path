# Baseline speed


## c5n.xlarge

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

=====

tRex

trex>start -f stl/udp_for_benchmarks.py --port 0 -m 100% -t packet_len=64,stream_count=1

trex>stats
Global Statistics

connection   : localhost, Port 4501                       total_tx_L2  : 297.89 Mbps                    
version      : STL @ v3.00                                total_tx_L1  : 390.98 Mbps                    
cpu_util.    : 100.0% @ 1 cores (1 per dual port)         total_rx     : 297.88 Mbps                    
rx_cpu_util. : 1.63% / 581.81 Kpps                        total_pps    : 581.81 Kpps                    
async_util.  : 0% / 0.62 bps                              drop_rate    : 0 bps                          
total_cps.   : 0 cps                                      queue_full   : 0 pkts                         

Port Statistics

   port    |         0         |         1         |       total       
-----------+-------------------+-------------------+------------------
owner      |            ubuntu |            ubuntu |                   
link       |                UP |                UP |                   
state      |      TRANSMITTING |              IDLE |                   
speed      |        16.38 Gb/s |        16.38 Gb/s |                   
CPU util.  |            100.0% |              0.0% |                   
--         |                   |                   |                   
Tx bps L2  |       297.89 Mbps |        180.39 bps |       297.89 Mbps 
Tx bps L1  |       390.98 Mbps |        258.82 bps |       390.98 Mbps 
Tx pps     |       581.81 Kpps |          0.49 pps |       581.81 Kpps 
Line Util. |            2.39 % |               0 % |                   
---        |                   |                   |                   
Rx bps     |        180.39 bps |       297.88 Mbps |       297.88 Mbps 
Rx pps     |          0.49 pps |        581.8 Kpps |        581.8 Kpps 
----       |                   |                   |                   
opackets   |          85499354 |                19 |          85499373 
ipackets   |                19 |          85494756 |          85494775 
obytes     |        5471958314 |               874 |        5471959188 
ibytes     |               874 |        5471664042 |        5471664916 
tx-pkts    |        85.5 Mpkts |           19 pkts |        85.5 Mpkts 
rx-pkts    |           19 pkts |       85.49 Mpkts |       85.49 Mpkts 
tx-bytes   |           5.47 GB |             874 B |           5.47 GB 
rx-bytes   |             874 B |           5.47 GB |           5.47 GB 
-----      |                   |                   |                   
oerrors    |                 0 |                 0 |                 0 
ierrors    |                 0 |             2,731 |             2,731 


==========
```bash
trex>start -f stl/udp_for_benchmarks.py --port 0 -m 100mpps -t packet_len=64,stream_count=1
Removing all streams from port(s) [0._]:                     [SUCCESS]
Attaching 1 streams to port(s) [0._]:                        [SUCCESS]
Starting traffic on port(s) [0._]:                           [FAILED]
start - Port 0 : *** Expected L1 B/W: '67.2 Gbps' exceeds port line rate: '16.384 Gbps'

trex>start -f stl/udp_for_benchmarks.py --port 0 -m 25mpps -t packet_len=64,stream_count=1
Removing all streams from port(s) [0._]:                     [SUCCESS]
Attaching 1 streams to port(s) [0._]:                        [SUCCESS]
Starting traffic on port(s) [0._]:                           [FAILED]
start - Port 0 : *** Expected L1 B/W: '16.8 Gbps' exceeds port line rate: '16.384 Gbps'
```

===============
## c5n.2xlarge

trex>start -f stl/udp_for_benchmarks.py --port 0 -m 100% -d 30 -t packet_len=64,stream_count=1
trex>stats
Global Statistics

connection   : localhost, Port 4501                       total_tx_L2  : 229.87 Mbps                    
version      : STL @ v3.00                                total_tx_L1  : 301.71 Mbps                    
cpu_util.    : 99.99% @ 1 cores (1 per dual port)         total_rx     : 229.86 Mbps                    
rx_cpu_util. : 1.14% / 448.94 Kpps                        total_pps    : 448.97 Kpps                    
async_util.  : 0% / 1.2 bps                               drop_rate    : 0 bps                          
total_cps.   : 0 cps                                      queue_full   : 7,256,929 pkts                 

Port Statistics

   port    |         0         |         1         |       total       
-----------+-------------------+-------------------+------------------
owner      |            ubuntu |            ubuntu |                   
link       |                UP |                UP |                   
state      |      TRANSMITTING |              IDLE |                   
speed      |        16.38 Gb/s |        16.38 Gb/s |                   
CPU util.  |            99.99% |              0.0% |                   
--         |                   |                   |                   
Tx bps L2  |       229.87 Mbps |          0.04 bps |       229.87 Mbps 
Tx bps L1  |       301.71 Mbps |          0.06 bps |       301.71 Mbps 
Tx pps     |       448.97 Kpps |             0 pps |       448.97 Kpps 
Line Util. |            1.84 % |               0 % |                   
---        |                   |                   |                   
Rx bps     |          0.04 bps |       229.86 Mbps |       229.86 Mbps 
Rx pps     |             0 pps |       448.94 Kpps |       448.94 Kpps 
----       |                   |                   |                   
opackets   |          14345798 |                 1 |          14345799 
ipackets   |                 1 |          14344783 |          14344784 
obytes     |         918131054 |                46 |         918131100 
ibytes     |                46 |         918066094 |         918066140 
tx-pkts    |       14.35 Mpkts |            1 pkts |       14.35 Mpkts 
rx-pkts    |            1 pkts |       14.34 Mpkts |       14.34 Mpkts 
tx-bytes   |         918.13 MB |              46 B |         918.13 MB 
rx-bytes   |              46 B |         918.07 MB |         918.07 MB 
-----      |                   |                   |                   
oerrors    |                 0 |                 0 |                 0 
ierrors    |                 0 |                 0 |                 0 






======================================

## c5n.18large


### iperf

ubuntu@tRex:/opt/trex/v3.00$ iperf3 -s -p 8001



ubuntu@xdp-DUT:~/$ iperf3 -c 198.18.60.11 -P 10 -i 1 -t 30 -V -p 8001




### tRex

trex>start -f stl/udp_for_benchmarks.py --port 0 -m 100% -d 30 -t packet_len=64,stream_count=1
trex>stats
trex>start -f stl/udp_for_benchmarks.py --port 0 -m 100mpps -t packet_len=64,stream_count=1
