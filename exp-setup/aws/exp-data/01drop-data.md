
## tRex

start -f stl/udp_for_benchmarks.py --port 0 -m 24mpps -t packet_len=64,stream_count=1



## Linux

Every 2.0s: sudo iptables -t raw -L -v -n -x | head		2022-11-29 11:09:04.780228

Chain PREROUTING (policy ACCEPT 0.8/s packets, 79.5/s bytes)
    pkts      bytes target     prot opt in     out     source               destination         
582.0k/s    26.8m/s DROP       all  --  ens6   *       0.0.0.0/0            0.0.0.0/0           

Chain OUTPUT (policy ACCEPT 1.2/s packets, 162.3/s bytes)
    pkts      bytes target     prot opt in     out     source               destination



## XDP


sudo ./xdp_rxq_info --dev ens6 --action XDP_DROP



```
Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       582607      0          
XDP-RX CPU      total   582607     

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   582607      0          
rx_queue_index    0:sum 582607     

Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       582609      0          
XDP-RX CPU      total   582609     

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   582609      0          
rx_queue_index    0:sum 582609     
```




===================================================

