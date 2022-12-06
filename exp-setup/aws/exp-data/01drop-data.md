
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

100%

## Linux Raw



### 1 c 

sudo ethtool -L ens6 combined 1
sudo ethtool -X ens6 equal 1

Stream 1 
```bash
Every 2.0s: sudo iptables -t raw -L -v -n -x | head		2022-12-06 03:00:31.885405

Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
   1.1m/s    49.4m/s DROP       all  --  ens6   *       0.0.0.0/0            0.0.0.0/0     
```


### 2 C

sudo ethtool -L ens6 combined 2
sudo ethtool -X ens6 equal 2

Stream 2

```bash
Every 2.0s: sudo iptables -t raw -L -v -n -x | head		2022-12-06 03:12:05.536378

Chain PREROUTING (policy ACCEPT 1.6/s packets, 131.8/s bytes)
    pkts      bytes target     prot opt in     out     source               destination         
   2.1m/s     94.3m/s DROP       all  --  ens6   *       0.0.0.0/0            0.0.0.0/0  
```

```
Show adapter(s) (ens6) statistics (ONLY that changed!)
 ***WARN***: Sample period (1) not accurate (11.0180571079254)
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:     95422150 (     95,422,150) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:      2074393 (      2,074,393) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:      2074397 (      2,074,397) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:      2074393 (      2,074,393) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:           50 (             50) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:         1017 (          1,017) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        32839 (         32,839) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:         1017 (          1,017) <= queue_0_tx_unmask_interrupt /sec
```

### 3 C


```bash
Every 2.0s: sudo iptables -t raw -L -v -n -x | head		2022-12-06 03:14:35.895610

Chain PREROUTING (policy ACCEPT 1.2/s packets, 100.1/s bytes)
    pkts      bytes target     prot opt in     out     source               destination         
  3.2m/s   145.9m/s DROP       all  --  ens6   *       0.0.0.0/0            0.0.0.0/0       
```

```
Show adapter(s) (ens6) statistics (ONLY that changed!)
 ***WARN***: Sample period (1) not accurate (11.0183660984039)
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:     48788640 (     48,788,640) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:      1060622 (      1,060,622) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:      1060621 (      1,060,621) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:      1060622 (      1,060,622) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:           17 (             17) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:        30839 (         30,839) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        31470 (         31,470) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:        30839 (         30,839) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens6    ) stat:     96799250 (     96,799,250) <= queue_1_rx_bytes /sec
Ethtool(ens6    ) stat:      2104332 (      2,104,332) <= queue_1_rx_cnt /sec
Ethtool(ens6    ) stat:      2104330 (      2,104,330) <= queue_1_rx_csum_good /sec
Ethtool(ens6    ) stat:      2104332 (      2,104,332) <= queue_1_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:          907 (            907) <= queue_1_tx_napi_comp /sec
Ethtool(ens6    ) stat:        33259 (         33,259) <= queue_1_tx_tx_poll /sec
Ethtool(ens6    ) stat:          907 (            907) <= queue_1_tx_unmask_interrupt /sec
Ethtool(ens6    ) stat:           17 (             17) <= queue_2_tx_bytes /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_2_tx_cnt /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_2_tx_doorbells /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_2_tx_napi_comp /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_2_tx_tx_poll /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_2_tx_unmask_interrupt /sec
```


### 4 C

sudo ethtool -L ens6 combined 4
sudo ethtool -X ens6 equal 4

Stream 4

Show adapter(s) (ens6) statistics (ONLY that changed!)
 ***WARN***: Sample period (1) not accurate (5.43413114547729)
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:    201652145 (    201,652,145) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:      4383741 (      4,383,741) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:      4383745 (      4,383,745) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:      4383741 (      4,383,741) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:        68496 (         68,496) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:          100 (            100) <= queue_3_tx_bytes /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_3_tx_cnt /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_3_tx_doorbells /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_3_tx_napi_comp /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_3_tx_tx_poll /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_3_tx_unmask_interrupt /sec


### 5 C 

sudo ethtool -L ens6 combined 5
sudo ethtool -X ens6 equal 5

Stream 5
```
Every 2.0s: sudo iptables -t raw -L -v -n -x | head		2022-12-06 03:24:45.646390

Chain PREROUTING (policy ACCEPT 1.2/s packets, 93.2/s bytes)
    pkts      bytes target     prot opt in     out     source               destination         
   5.2m/s   240.5m/s DROP       all  --  ens6   *       0.0.0.0/0            0.0.0.0/0      
```
```
Show adapter(s) (ens6) statistics (ONLY that changed!)
 ***WARN***: Sample period (1) not accurate (11.0192940235138)
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:           58 (             58) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:           20 (             20) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens6    ) stat:     48565207 (     48,565,207) <= queue_1_rx_bytes /sec
Ethtool(ens6    ) stat:      1055765 (      1,055,765) <= queue_1_rx_cnt /sec
Ethtool(ens6    ) stat:      1055766 (      1,055,766) <= queue_1_rx_csum_good /sec
Ethtool(ens6    ) stat:      1055765 (      1,055,765) <= queue_1_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:           17 (             17) <= queue_1_tx_bytes /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_1_tx_cnt /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_1_tx_doorbells /sec
Ethtool(ens6    ) stat:        29798 (         29,798) <= queue_1_tx_napi_comp /sec
Ethtool(ens6    ) stat:        30219 (         30,219) <= queue_1_tx_tx_poll /sec
Ethtool(ens6    ) stat:        29798 (         29,798) <= queue_1_tx_unmask_interrupt /sec
Ethtool(ens6    ) stat:     96332922 (     96,332,922) <= queue_2_rx_bytes /sec
Ethtool(ens6    ) stat:      2094194 (      2,094,194) <= queue_2_rx_cnt /sec
Ethtool(ens6    ) stat:      2094193 (      2,094,193) <= queue_2_rx_csum_good /sec
Ethtool(ens6    ) stat:      2094194 (      2,094,194) <= queue_2_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:          729 (            729) <= queue_2_tx_napi_comp /sec
Ethtool(ens6    ) stat:        33029 (         33,029) <= queue_2_tx_tx_poll /sec
Ethtool(ens6    ) stat:          729 (            729) <= queue_2_tx_unmask_interrupt /sec
Ethtool(ens6    ) stat:     49078006 (     49,078,006) <= queue_3_rx_bytes /sec
Ethtool(ens6    ) stat:      1066913 (      1,066,913) <= queue_3_rx_cnt /sec
Ethtool(ens6    ) stat:      1066915 (      1,066,915) <= queue_3_rx_csum_good /sec
Ethtool(ens6    ) stat:      1066913 (      1,066,913) <= queue_3_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:        25227 (         25,227) <= queue_3_tx_napi_comp /sec
Ethtool(ens6    ) stat:        29983 (         29,983) <= queue_3_tx_tx_poll /sec
Ethtool(ens6    ) stat:        25227 (         25,227) <= queue_3_tx_unmask_interrupt /sec
Ethtool(ens6    ) stat:     46898418 (     46,898,418) <= queue_4_rx_bytes /sec
Ethtool(ens6    ) stat:      1019531 (      1,019,531) <= queue_4_rx_cnt /sec
Ethtool(ens6    ) stat:      1019529 (      1,019,529) <= queue_4_rx_csum_good /sec
Ethtool(ens6    ) stat:      1019531 (      1,019,531) <= queue_4_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:        30564 (         30,564) <= queue_4_tx_napi_comp /sec
Ethtool(ens6    ) stat:        30732 (         30,732) <= queue_4_tx_tx_poll /sec
Ethtool(ens6    ) stat:        30564 (         30,564) <= queue_4_tx_unmask_interrupt /sec
```
### 6 C 

sudo ethtool -L ens6 combined 6
sudo ethtool -X ens6 equal 6

Stream 6

```

Every 2.0s: sudo iptables -t raw -L -v -n -x | head		2022-12-06 03:28:44.918648

Chain PREROUTING (policy ACCEPT 8.7/s packets, 1.2k/s bytes)
    pkts      bytes target     prot opt in     out     source               destination         
   7.5m/s    343.9m/s DROP       all  --  ens6   *       0.0.0.0/0            0.0.0.0/0  
```

```
 ***WARN***: Sample period (1) not accurate (11.0187380313873)
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:     48794235 (     48,794,235) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:      1060743 (      1,060,743) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:      1060743 (      1,060,743) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:      1060743 (      1,060,743) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:            4 (              4) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:        12417 (         12,417) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        23017 (         23,017) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:        12417 (         12,417) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens6    ) stat:     24465714 (     24,465,714) <= queue_1_rx_bytes /sec
Ethtool(ens6    ) stat:       531863 (        531,863) <= queue_1_rx_cnt /sec
Ethtool(ens6    ) stat:       531863 (        531,863) <= queue_1_rx_csum_good /sec
Ethtool(ens6    ) stat:       531863 (        531,863) <= queue_1_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:        43292 (         43,292) <= queue_1_tx_napi_comp /sec
Ethtool(ens6    ) stat:        43293 (         43,293) <= queue_1_tx_tx_poll /sec
Ethtool(ens6    ) stat:        43292 (         43,292) <= queue_1_tx_unmask_interrupt /sec
Ethtool(ens6    ) stat:     48085984 (     48,085,984) <= queue_2_rx_bytes /sec
Ethtool(ens6    ) stat:      1045347 (      1,045,347) <= queue_2_rx_cnt /sec
Ethtool(ens6    ) stat:      1045347 (      1,045,347) <= queue_2_rx_csum_good /sec
Ethtool(ens6    ) stat:      1045347 (      1,045,347) <= queue_2_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:        30346 (         30,346) <= queue_2_tx_napi_comp /sec
Ethtool(ens6    ) stat:        30853 (         30,853) <= queue_2_tx_tx_poll /sec
Ethtool(ens6    ) stat:        30346 (         30,346) <= queue_2_tx_unmask_interrupt /sec
Ethtool(ens6    ) stat:     72459433 (     72,459,433) <= queue_4_rx_bytes /sec
Ethtool(ens6    ) stat:      1575205 (      1,575,205) <= queue_4_rx_cnt /sec
Ethtool(ens6    ) stat:      1575207 (      1,575,207) <= queue_4_rx_csum_good /sec
Ethtool(ens6    ) stat:      1575205 (      1,575,205) <= queue_4_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:           17 (             17) <= queue_4_tx_bytes /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_4_tx_cnt /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_4_tx_doorbells /sec
Ethtool(ens6    ) stat:         5917 (          5,917) <= queue_4_tx_napi_comp /sec
Ethtool(ens6    ) stat:        27604 (         27,604) <= queue_4_tx_tx_poll /sec
Ethtool(ens6    ) stat:         5917 (          5,917) <= queue_4_tx_unmask_interrupt /sec
Ethtool(ens6    ) stat:     48928160 (     48,928,160) <= queue_5_rx_bytes /sec
Ethtool(ens6    ) stat:      1063656 (      1,063,656) <= queue_5_rx_cnt /sec
Ethtool(ens6    ) stat:      1063655 (      1,063,655) <= queue_5_rx_csum_good /sec
Ethtool(ens6    ) stat:      1063656 (      1,063,656) <= queue_5_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:           17 (             17) <= queue_5_tx_bytes /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_5_tx_cnt /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_5_tx_doorbells /sec
Ethtool(ens6    ) stat:        22416 (         22,416) <= queue_5_tx_napi_comp /sec
Ethtool(ens6    ) stat:        28748 (         28,748) <= queue_5_tx_tx_poll /sec
Ethtool(ens6    ) stat:        22416 (         22,416) <= queue_5_tx_unmask_interrupt /sec
```


## Linux Conntack


### 1 C

sudo ethtool -L ens6 combined 1
sudo ethtool -X ens6 equal 1

Stream 1 

```
Every 2.0s: sudo iptables -L -v -n -x | head		2022-12-06 03:39:27.133643

Chain INPUT (policy ACCEPT 1.4/s packets, 102.3/s bytes)
    pkts      bytes target     prot opt in     out     source               destination         
     3.3/s   433.4/s ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
876.5k/s    40.3m/s DROP       udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpts:9:19

```

### 2C

sudo ethtool -L ens6 combined 2
sudo ethtool -X ens6 equal 2

Stream 2

```
Every 2.0s: sudo iptables -L -v -n -x | head		2022-12-06 03:42:50.290456

Chain INPUT (policy ACCEPT 0.8/s packets, 54.2/s bytes)
    pkts      bytes target     prot opt in     out     source               destination         
     2.6/s    342.5/s ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
  1.3m/s    60.7m/s DROP       udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpts:9:19

```


### 3C

sudo ethtool -L ens6 combined 3
sudo ethtool -X ens6 equal 3

Stream 3

```bash
Every 2.0s: sudo iptables -L -v -n -x | head		2022-12-06 03:44:32.493275

Chain INPUT (policy ACCEPT 0.6/s packets, 42.6/s bytes)
    pkts      bytes target     prot opt in     out     source               destination         
     6.1/s    822.4/s ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
  2.7m/s   122.7m/s DROP       udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpts:9:19
```

### 4C

sudo ethtool -L ens6 combined 4
sudo ethtool -X ens6 equal 4

Stream 4

```bash
Every 2.0s: sudo iptables -L -v -n -x | head		2022-12-06 03:49:08.957942

Chain INPUT (policy ACCEPT 3.4/s packets, 252.4/s bytes)
    pkts      bytes target     prot opt in     out     source               destination         
     5.4/s    611.2/s ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
   3.0m/s   138.6m/s DROP       udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpts:9:19


```

```
Every 2.0s: sudo iptables -L -v -n -x | head		2022-12-06 03:51:11.937343

Chain INPUT (policy ACCEPT 2.0/s packets, 140.1/s bytes)
    pkts      bytes target     prot opt in     out     source               destination         
     11.4/s    1.4k/s ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
  3.6m/s   163.9m/s DROP       udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpts:9:19

Chain OUTPUT (policy ACCEPT 11.9/s packets, 1.4k/s bytes)
    pkts      bytes target     prot opt in     out     source               destination
```

```
Every 2.0s: sudo iptables -L -v -n -x | head		2022-12-06 03:52:27.001313

Chain INPUT (policy ACCEPT 2.0/s packets, 140.1/s bytes)
    pkts      bytes target     prot opt in     out     source               destination         
     8.4/s    1.2k/s ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
   4.1m/s   188.3m/s DROP       udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpts:9:19

```

## XDP_DROP


### 1C

sudo ethtool -X ens6 equal 1
sudo ethtool -L ens6 combined 1

Stream 1

```
Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       1072613     0          
XDP-RX CPU      total   1072613    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   1072624     0          
rx_queue_index    0:sum 1072624    

Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       1070734     0          
XDP-RX CPU      total   1070734    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   1070734     0          
rx_queue_index    0:sum 1070734    
```

### 2C

sudo ethtool -L ens6 combined 2
sudo ethtool -X ens6 equal 2

Stream 2

```bash
Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       2090063     0          
XDP-RX CPU      total   2090063    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   2090063     0          
rx_queue_index    0:sum 2090063    

Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       2095311     0          
XDP-RX CPU      total   2095311    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   2095334     0          
rx_queue_index    0:sum 2095334    
```

### 3C

sudo ethtool -L ens6 combined 3
sudo ethtool -X ens6 equal 3

Stream 3

```bash
Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       1068843     0          
XDP-RX CPU      1       2112647     0          
XDP-RX CPU      total   3181490    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   1068834     0          
rx_queue_index    0:sum 1068834    
rx_queue_index    1:1   2112666     0          
rx_queue_index    1:sum 2112666    

Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       1070399     0          
XDP-RX CPU      1       2106358     0          
XDP-RX CPU      total   3176757    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   1070399     0          
rx_queue_index    0:sum 1070399    
rx_queue_index    1:1   2106322     0          
rx_queue_index    1:sum 2106322    
```

### 4C

sudo ethtool -L ens6 combined 4
sudo ethtool -X ens6 equal 4

Stream 4

```
Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       2849581     0          
XDP-RX CPU      1       1064744     0          
XDP-RX CPU      total   3914326    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   2849666     0          
rx_queue_index    0:sum 2849666    
rx_queue_index    1:1   1064744     0          
rx_queue_index    1:sum 1064744    

Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       2849298     0          
XDP-RX CPU      1       1064186     0          
XDP-RX CPU      total   3913484    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   2849213     0          
rx_queue_index    0:sum 2849213    
rx_queue_index    1:1   1064174     0          
rx_queue_index    1:sum 1064174    

Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       2857345     0          
XDP-RX CPU      1       1063768     0          
XDP-RX CPU      total   3921114    
```

### 5C

sudo ethtool -L ens6 combined 5
sudo ethtool -X ens6 equal 5

Stream 5

```
Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      1       1054189     0          
XDP-RX CPU      2       2109685     0          
XDP-RX CPU      3       1060441     0          
XDP-RX CPU      4       1033907     0          
XDP-RX CPU      total   5258224    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    1:1   1054194     0          
rx_queue_index    1:sum 1054194    
rx_queue_index    2:2   2109685     0          
rx_queue_index    2:sum 2109685    
rx_queue_index    3:3   1060426     0          
rx_queue_index    3:sum 1060426    
rx_queue_index    4:4   1033895     0          
rx_queue_index    4:sum 1033895    

Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      1       1053602     0          
XDP-RX CPU      2       2104273     0          
XDP-RX CPU      3       1058775     0          
XDP-RX CPU      4       1035909     0          
XDP-RX CPU      total   5252561    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    1:1   1053605     0          
rx_queue_index    1:sum 1053605    
rx_queue_index    2:2   2104274     0          
rx_queue_index    2:sum 2104274    
rx_queue_index    3:3   1058775     0          
rx_queue_index    3:sum 1058775    
rx_queue_index    4:4   1035921     0          
rx_queue_index    4:sum 1035921    
```

### 6C

sudo ethtool -L ens6 combined 6
sudo ethtool -X ens6 equal 6

Stream 6

```bash
Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       537343      0          
XDP-RX CPU      1       2039836     0          
XDP-RX CPU      2       964940      0          
XDP-RX CPU      4       1502568     0          
XDP-RX CPU      5       964907      0          
XDP-RX CPU      total   6009595    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   537343      0          
rx_queue_index    0:sum 537343     
rx_queue_index    1:1   2039836     0          
rx_queue_index    1:sum 2039836    
rx_queue_index    2:2   964938      0          
rx_queue_index    2:sum 964938     
rx_queue_index    4:4   1502568     0          
rx_queue_index    4:sum 1502568    
rx_queue_index    5:5   964907      0          
rx_queue_index    5:sum 964907     

Running XDP on dev:ens6 (ifindex:3) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       536311      0          
XDP-RX CPU      1       2038690     0          
XDP-RX CPU      2       965099      0          
XDP-RX CPU      4       1502396     0          
XDP-RX CPU      5       965093      0          
XDP-RX CPU      total   6007592    
```