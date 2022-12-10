
1 core

start -f /home/ubuntu/xdp_scripts/udp_multi_ip.py --port 0 -m 100% -t packet_len=64,stream_count=1,port_count=1 


Linux
```
Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:       239902 (        239,902) <= pps_allowance_exceeded /sec
Ethtool(ens6    ) stat:     39846108 (     39,846,108) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:       866203 (        866,203) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:       866196 (        866,196) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:       866203 (        866,203) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:          673 (            673) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:        47531 (         47,531) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        47636 (         47,636) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:        47531 (         47,531) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:         1153 (          1,153) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:          673 (            673) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_unmask_interrupt /sec
```

XDP

```bash
Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:       233510 (        233,510) <= pps_allowance_exceeded /sec
Ethtool(ens6    ) stat:     40027759 (     40,027,759) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:       870151 (        870,151) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:       870144 (        870,144) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:       870151 (        870,151) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:       870151 (        870,151) <= queue_0_rx_xdp_pass /sec
Ethtool(ens6    ) stat:          673 (            673) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:        36822 (         36,822) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        36938 (         36,938) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:        36822 (         36,822) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:         1153 (          1,153) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_xdp_pass /sec
Ethtool(ens7    ) stat:          673 (            673) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_unmask_interrupt /sec
```



After full route install 

Linux

```bash
Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:       252467 (        252,467) <= pps_allowance_exceeded /sec
Ethtool(ens6    ) stat:     38833632 (     38,833,632) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:       844192 (        844,192) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:       844182 (        844,182) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:       844192 (        844,192) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:          673 (            673) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:        40223 (         40,223) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        40447 (         40,447) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:        40223 (         40,223) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:         1153 (          1,153) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:          673 (            673) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_unmask_interrupt /sec
```









XDP 


```bash
Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:       243516 (        243,516) <= pps_allowance_exceeded /sec
Ethtool(ens6    ) stat:     35968850 (     35,968,850) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:       781914 (        781,914) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:       781907 (        781,907) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:       781914 (        781,914) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:       781914 (        781,914) <= queue_0_rx_xdp_pass /sec
Ethtool(ens6    ) stat:          671 (            671) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:        35962 (         35,962) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        36693 (         36,693) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:        35962 (         35,962) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:         1150 (          1,150) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_xdp_pass /sec
Ethtool(ens7    ) stat:          671 (            671) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_unmask_interrupt /sec
```



========



# Simple routing 


## Test 

Linux, 100kpps traffic . See tx_packets 

```
Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:      4600673 (      4,600,673) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:        99997 (         99,997) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:        99990 (         99,990) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:        99997 (         99,997) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:          672 (            672) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:        16470 (         16,470) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        16470 (         16,470) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:        16470 (         16,470) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:         1152 (          1,152) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:      6000867 (      6,000,867) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:       100011 (        100,011) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:       100008 (        100,008) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:        19417 (         19,417) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:        19417 (         19,417) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:        19417 (         19,417) <= queue_0_tx_unmask_interrupt /sec

Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:      4600868 (      4,600,868) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:       100002 (        100,002) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:        99994 (         99,994) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:       100002 (        100,002) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:          673 (            673) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:        16478 (         16,478) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        16478 (         16,478) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:        16478 (         16,478) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:         1152 (          1,152) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:      6000872 (      6,000,872) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:       100011 (        100,011) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:       100011 (        100,011) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:        19403 (         19,403) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:        19403 (         19,403) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:        19403 (         19,403) <= queue_0_tx_unmask_interrupt /sec
```




## Linux , Single route 

Full bandwidth, 100%  4Mpps

```
Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:       227648 (        227,648) <= pps_allowance_exceeded /sec
Ethtool(ens6    ) stat:     40042577 (     40,042,577) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:       870474 (        870,474) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:       870458 (        870,458) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:       870474 (        870,474) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:          673 (            673) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:          779 (            779) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        13714 (         13,714) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:          779 (            779) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:         1153 (          1,153) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:     52229094 (     52,229,094) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:       870482 (        870,482) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:       870427 (        870,427) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:        14041 (         14,041) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:        14041 (         14,041) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:        14041 (         14,041) <= queue_0_tx_unmask_interrupt /sec

Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:       227691 (        227,691) <= pps_allowance_exceeded /sec
Ethtool(ens6    ) stat:     40123518 (     40,123,518) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:       872233 (        872,233) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:       872217 (        872,217) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:       872233 (        872,233) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:          673 (            673) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:          582 (            582) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        13707 (         13,707) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:          582 (            582) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:         1152 (          1,152) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:     52307910 (     52,307,910) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:       871795 (        871,795) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:       871754 (        871,754) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:        13929 (         13,929) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:        13929 (         13,929) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:        13929 (         13,929) <= queue_0_tx_unmask_interrupt /sec

Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:       226518 (        226,518) <= pps_allowance_exceeded /sec
Ethtool(ens6    ) stat:     40088032 (     40,088,032) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:       871462 (        871,462) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:       871415 (        871,415) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:       871462 (        871,462) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:          672 (            672) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:          612 (            612) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        13705 (         13,705) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:          612 (            612) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:         1180 (          1,180) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            9 (              9) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            9 (              9) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:     52331851 (     52,331,851) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:       872194 (        872,194) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:       872062 (        872,062) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:        13988 (         13,988) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:        13988 (         13,988) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:        13988 (         13,988) <= queue_0_tx_unmask_interrupt /sec
```


```
Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
 ***WARN***: Sample period (1) not accurate (21.036957025528)
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:            3 (              3) <= pps_allowance_exceeded /sec
Ethtool(ens6    ) stat:     27658995 (     27,658,995) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:       601282 (        601,282) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:       601283 (        601,283) <= queue_0_rx_csum_good /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:       601282 (        601,282) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:           40 (             40) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:         9395 (          9,395) <= queue_0_tx_tx_poll /sec
 ***WARN***: Sample period (1) not accurate (21.0371358394623)
Ethtool(ens7    ) stat:            0 (              0) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            0 (              0) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:           17 (             17) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            0 (              0) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            0 (              0) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            0 (              0) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:     32401109 (     32,401,109) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:       540018 (        540,018) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:        23428 (         23,428) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:        11714 (         11,714) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:        11714 (         11,714) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:        11714 (         11,714) <= queue_0_tx_unmask_interrupt /sec

```

## XDP 


```
Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:       245347 (        245,347) <= pps_allowance_exceeded /sec
Ethtool(ens6    ) stat:         1151 (          1,151) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:       848125 (        848,125) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_xdp_pass /sec
Ethtool(ens6    ) stat:       848166 (        848,166) <= queue_0_rx_xdp_redirect /sec
Ethtool(ens6    ) stat:          672 (            672) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:         6644 (          6,644) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        16450 (         16,450) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:         6644 (          6,644) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:         1151 (          1,151) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_xdp_pass /sec
Ethtool(ens7    ) stat:          672 (            672) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:           13 (             13) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:           13 (             13) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:           13 (             13) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:     50894637 (     50,894,637) <= queue_1_xdp_tx_bytes /sec
Ethtool(ens7    ) stat:       848244 (        848,244) <= queue_1_xdp_tx_cnt /sec
Ethtool(ens7    ) stat:        16444 (         16,444) <= queue_1_xdp_tx_doorbells /sec
Ethtool(ens7    ) stat:        58351 (         58,351) <= queue_1_xdp_tx_napi_comp /sec
Ethtool(ens7    ) stat:        58673 (         58,673) <= queue_1_xdp_tx_tx_poll /sec
Ethtool(ens7    ) stat:        58351 (         58,351) <= queue_1_xdp_tx_unmask_interrupt /sec

Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:       246941 (        246,941) <= pps_allowance_exceeded /sec
Ethtool(ens6    ) stat:         1179 (          1,179) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:       845088 (        845,088) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:            9 (              9) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:            9 (              9) <= queue_0_rx_xdp_pass /sec
Ethtool(ens6    ) stat:       845021 (        845,021) <= queue_0_rx_xdp_redirect /sec
Ethtool(ens6    ) stat:          713 (            713) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            9 (              9) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            9 (              9) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:         6180 (          6,180) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        16187 (         16,187) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:         6180 (          6,180) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:         1179 (          1,179) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            9 (              9) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            9 (              9) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:            9 (              9) <= queue_0_rx_xdp_pass /sec
Ethtool(ens7    ) stat:          713 (            713) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:            9 (              9) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:            9 (              9) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:           16 (             16) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:     50693717 (     50,693,717) <= queue_1_xdp_tx_bytes /sec
Ethtool(ens7    ) stat:       844895 (        844,895) <= queue_1_xdp_tx_cnt /sec
Ethtool(ens7    ) stat:        16183 (         16,183) <= queue_1_xdp_tx_doorbells /sec
Ethtool(ens7    ) stat:        58082 (         58,082) <= queue_1_xdp_tx_napi_comp /sec
Ethtool(ens7    ) stat:        58405 (         58,405) <= queue_1_xdp_tx_tx_poll /sec
Ethtool(ens7    ) stat:        58082 (         58,082) <= queue_1_xdp_tx_unmask_interrupt /sec

Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:       246109 (        246,109) <= pps_allowance_exceeded /sec
Ethtool(ens6    ) stat:         1151 (          1,151) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:       847643 (        847,643) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_rx_xdp_pass /sec
Ethtool(ens6    ) stat:       847635 (        847,635) <= queue_0_rx_xdp_redirect /sec
Ethtool(ens6    ) stat:          672 (            672) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:         6877 (          6,877) <= queue_0_tx_napi_comp /sec
Ethtool(ens6    ) stat:        16562 (         16,562) <= queue_0_tx_tx_poll /sec
Ethtool(ens6    ) stat:         6877 (          6,877) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            1 (              1) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:         1151 (          1,151) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_rx_xdp_pass /sec
Ethtool(ens7    ) stat:          672 (            672) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:            8 (              8) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:           15 (             15) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:           15 (             15) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:           15 (             15) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:     50832527 (     50,832,527) <= queue_1_xdp_tx_bytes /sec
Ethtool(ens7    ) stat:       847209 (        847,209) <= queue_1_xdp_tx_cnt /sec
Ethtool(ens7    ) stat:        16542 (         16,542) <= queue_1_xdp_tx_doorbells /sec
Ethtool(ens7    ) stat:        58250 (         58,250) <= queue_1_xdp_tx_napi_comp /sec
Ethtool(ens7    ) stat:        58583 (         58,583) <= queue_1_xdp_tx_tx_poll /sec
Ethtool(ens7    ) stat:        58250 (         58,250) <= queue_1_xdp_tx_unmask_interrupt /sec
```



```
Show adapter(s) (ens6 ens7) statistics (ONLY that changed!)
 ***WARN***: Sample period (1) not accurate (21.0404360294342)
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_completed_cmd /sec
Ethtool(ens6    ) stat:            0 (              0) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens6    ) stat:            4 (              4) <= pps_allowance_exceeded /sec
Ethtool(ens6    ) stat:           29 (             29) <= queue_0_rx_bytes /sec
Ethtool(ens6    ) stat:      1601570 (      1,601,570) <= queue_0_rx_cnt /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens6    ) stat:            0 (              0) <= queue_0_rx_xdp_pass /sec
Ethtool(ens6    ) stat:      1601570 (      1,601,570) <= queue_0_rx_xdp_redirect /sec
Ethtool(ens6    ) stat:           82 (             82) <= queue_0_tx_bytes /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_0_tx_cnt /sec
Ethtool(ens6    ) stat:            1 (              1) <= queue_0_tx_doorbells /sec
Ethtool(ens6    ) stat:        25025 (         25,025) <= queue_0_tx_tx_poll /sec
 ***WARN***: Sample period (1) not accurate (31.0436251163483)
Ethtool(ens7    ) stat:            0 (              0) <= ena_admin_q_completed_cmd /sec
Ethtool(ens7    ) stat:            0 (              0) <= ena_admin_q_submitted_cmd /sec
Ethtool(ens7    ) stat:        24803 (         24,803) <= pps_allowance_exceeded /sec
Ethtool(ens7    ) stat:           21 (             21) <= queue_0_rx_bytes /sec
Ethtool(ens7    ) stat:            0 (              0) <= queue_0_rx_cnt /sec
Ethtool(ens7    ) stat:            0 (              0) <= queue_0_rx_csum_unchecked /sec
Ethtool(ens7    ) stat:            0 (              0) <= queue_0_rx_rx_copybreak_pkt /sec
Ethtool(ens7    ) stat:            0 (              0) <= queue_0_rx_xdp_pass /sec
Ethtool(ens7    ) stat:           14 (             14) <= queue_0_tx_bytes /sec
Ethtool(ens7    ) stat:            0 (              0) <= queue_0_tx_cnt /sec
Ethtool(ens7    ) stat:            0 (              0) <= queue_0_tx_doorbells /sec
Ethtool(ens7    ) stat:            0 (              0) <= queue_0_tx_napi_comp /sec
Ethtool(ens7    ) stat:            0 (              0) <= queue_0_tx_tx_poll /sec
Ethtool(ens7    ) stat:            0 (              0) <= queue_0_tx_unmask_interrupt /sec
Ethtool(ens7    ) stat:     23915182 (     23,915,182) <= queue_1_xdp_tx_bytes /sec
Ethtool(ens7    ) stat:       398586 (        398,586) <= queue_1_xdp_tx_cnt /sec
Ethtool(ens7    ) stat:        16980 (         16,980) <= queue_1_xdp_tx_doorbells /sec
Ethtool(ens7    ) stat:        82126 (         82,126) <= queue_1_xdp_tx_napi_comp /sec
Ethtool(ens7    ) stat:        51785 (         51,785) <= queue_1_xdp_tx_prepare_ctx_err /sec
Ethtool(ens7    ) stat:        82126 (         82,126) <= queue_1_xdp_tx_tx_poll /sec
Ethtool(ens7    ) stat:        82126 (         82,126) <= queue_1_xdp_tx_unmask_interrupt /sec
```