# Benchmark Baseline 


## Hardware

**DUT Info:**

Server CPU:       1 x Intel(R) Core(TM) i5-6360U CPU @ 2.00GHz
Ports count:      2 x 1Gbps @ 82540EM Gigabit Ethernet Controller



**Traffic Generator Info:**

Server CPU:       1 x Intel(R) Core(TM) i5-6360U CPU @ 2.00GHz
Ports count:      2 x 1Gbps @ 82540EM Gigabit Ethernet Controller



**Line rate**

for 64 length packet
1 Gbps

1.3 mpps


At 100% bandwidth
```
trex>stats
Global Statistics

connection   : localhost, Port 4501                       total_tx_L2  : 29.58 Mbps                     
version      : STL @ v3.00                                total_tx_L1  : 38.83 Mbps                     
cpu_util.    : 97.74% @ 1 cores (1 per dual port)         total_rx     : 14.5 Mbps                      
rx_cpu_util. : 1.91% / 30.16 Kpps                         total_pps    : 57.78 Kpps                     
async_util.  : 0% / 4.43 bps                              drop_rate    : 15.08 Mbps                     
total_cps.   : 0 cps                                      queue_full   : 93,978,858 pkts                

Port Statistics

   port    |         0         |         1         |       total       
-----------+-------------------+-------------------+------------------
owner      |           vagrant |           vagrant |                   
link       |                UP |                UP |                   
state      |      TRANSMITTING |              IDLE |                   
speed      |            1 Gb/s |            1 Gb/s |                   
CPU util.  |            97.74% |              0.0% |                   
--         |                   |                   |                   
Tx bps L2  |        29.58 Mbps |             0 bps |        29.58 Mbps 
Tx bps L1  |        38.83 Mbps |             0 bps |        38.83 Mbps 
Tx pps     |        57.78 Kpps |             0 pps |        57.78 Kpps 
Line Util. |            3.88 % |               0 % |                   
---        |                   |                   |                   
Rx bps     |             0 bps |         14.5 Mbps |         14.5 Mbps 
Rx pps     |             0 pps |        30.21 Kpps |        30.21 Kpps 
----       |                   |                   |                   
opackets   |           9379004 |                 5 |           9379009 
ipackets   |                 0 |           4417235 |           4417235 
obytes     |         600256316 |               320 |         600256636 
ibytes     |                 0 |         264369540 |         264369540 
tx-pkts    |        9.38 Mpkts |            5 pkts |        9.38 Mpkts 
rx-pkts    |            0 pkts |        4.42 Mpkts |        4.42 Mpkts 
tx-bytes   |         600.26 MB |             320 B |         600.26 MB 
rx-bytes   |               0 B |         264.37 MB |         264.37 MB 
-----      |                   |                   |                   
oerrors    |                 0 |                 0 |                 0 
ierrors    |                 0 |                 0 |                 0 
```


But Line rate is less 

for 64 length packet
40 Mbps
40000000 bbs 
78125 pps
