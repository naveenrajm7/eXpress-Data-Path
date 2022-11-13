
# Experiment Runs - Data capture

## XDP Drop - 1 CPU , 1 Stream

```bash
RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   79992       0          
rx_queue_index    0:sum 79992      

Running XDP on dev:eth1 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       79381       0          
XDP-RX CPU      total   79381      

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   79381       0          
rx_queue_index    0:sum 79381      

Running XDP on dev:eth1 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       77817       0          
XDP-RX CPU      total   77817      

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   77817       0          
rx_queue_index    0:sum 77817      

Running XDP on dev:eth1 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       81635       0          
XDP-RX CPU      total   81635      

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   81635       0          
rx_queue_index    0:sum 81635      

Running XDP on dev:eth1 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       78671       0          
XDP-RX CPU      total   78671      

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   78672       0          
rx_queue_index    0:sum 78672      
```





## iptables raw , 1 CPU , 1 Stream

```bash
Every 2.0s: sudo iptables -t raw -L -v -n -x | head		2022-11-13 20:59:03.734420

Chain PREROUTING (policy ACCEPT 1.5/s packets, 59.2/s bytes)
    pkts      bytes target     prot opt in     out     source               destination         
 78.4k/s    3.6m/s DROP       all  --  eth1   *       0.0.0.0/0            0.0.0.0/0           

Chain OUTPUT (policy ACCEPT 1.5/s packets, 146.1/s bytes)
    pkts      bytes target     prot opt in     out     source               destination

```

# iptables conntrack , 1 CPU , 1 Stream

```bash
Every 2.0s: sudo iptables -L -v -n -x | head		2022-11-13 22:21:42.282268

Chain INPUT (policy ACCEPT 0.5/s packets, 19.6/s bytes)
    pkts      bytes target     prot opt in     out     source               destination         

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
 74.9k/s    3.4m/s DROP       udp  --  *      *       0.0.0.0/0            48.0.0.1             udp dpt:12

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source               destination
```