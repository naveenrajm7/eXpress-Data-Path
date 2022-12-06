
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

