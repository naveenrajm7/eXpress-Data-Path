# DDOS Test


trex>start -f stl/udp_for_benchmarks.py --port 0 -m XXpps -t packet_len=64,stream_count=1

## No XDP

* Generator speed 1 mpps , 27035.31 

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 38331.29 Trans/s over 1.127 seconds ending at 1670186133.138
Interim result: 32521.35 Trans/s over 1.179 seconds ending at 1670186134.317
...
Interim result: 30672.71 Trans/s over 1.112 seconds ending at 1670186171.038
Interim result: 30648.39 Trans/s over 1.007 seconds ending at 1670186172.044
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.03    27035.31   
16384  131072
```

* Generator speed 500 Kpps, 30880.03 


```bash
vagrant@xdp-DUT:~$  netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 32911.21 Trans/s over 6.146 seconds ending at 1670186365.608
Interim result: 32016.36 Trans/s over 5.140 seconds ending at 1670186370.748
Interim result: 31465.48 Trans/s over 5.088 seconds ending at 1670186375.836
Interim result: 32070.56 Trans/s over 5.000 seconds ending at 1670186380.836
Interim result: 32070.66 Trans/s over 5.019 seconds ending at 1670186385.855
Interim result: 28223.79 Trans/s over 5.681 seconds ending at 1670186391.536
Interim result: 27017.00 Trans/s over 5.223 seconds ending at 1670186396.760
Interim result: 31634.74 Trans/s over 2.706 seconds ending at 1670186399.466
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    30880.03 
```

* Generator speed 250 Kpps, 30179.29 

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 31359.33 Trans/s over 5.306 seconds ending at 1670186669.762
Interim result: 31904.02 Trans/s over 5.004 seconds ending at 1670186674.767
Interim result: 28228.90 Trans/s over 5.651 seconds ending at 1670186680.418
Interim result: 30315.26 Trans/s over 5.019 seconds ending at 1670186685.437
Interim result: 32465.91 Trans/s over 5.005 seconds ending at 1670186690.442
Interim result: 31634.59 Trans/s over 5.131 seconds ending at 1670186695.573
Interim result: 30844.94 Trans/s over 5.128 seconds ending at 1670186700.701
Interim result: 23029.77 Trans/s over 3.759 seconds ending at 1670186704.460
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    30179.29 
```

* Generator speed 100 Kpps, 31446

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 33576.80 Trans/s over 5.501 seconds ending at 1670186964.792
Interim result: 31258.52 Trans/s over 5.371 seconds ending at 1670186970.163
Interim result: 31821.50 Trans/s over 5.068 seconds ending at 1670186975.231
Interim result: 30296.18 Trans/s over 5.252 seconds ending at 1670186980.483
Interim result: 29281.49 Trans/s over 5.173 seconds ending at 1670186985.656
Interim result: 31286.28 Trans/s over 5.024 seconds ending at 1670186990.680
Interim result: 30505.41 Trans/s over 5.128 seconds ending at 1670186995.808
Interim result: 34390.89 Trans/s over 3.483 seconds ending at 1670186999.291
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    31446.21
```


* Generator speed 50 Kpps, 32266.96 

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 30247.14 Trans/s over 6.173 seconds ending at 1670187120.506
Interim result: 33942.98 Trans/s over 5.031 seconds ending at 1670187125.537
Interim result: 33100.57 Trans/s over 5.127 seconds ending at 1670187130.664
Interim result: 34112.04 Trans/s over 5.001 seconds ending at 1670187135.666
Interim result: 32384.46 Trans/s over 5.267 seconds ending at 1670187140.932
Interim result: 32002.49 Trans/s over 5.060 seconds ending at 1670187145.992
Interim result: 31714.29 Trans/s over 5.045 seconds ending at 1670187151.037
Interim result: 30463.63 Trans/s over 3.297 seconds ending at 1670187154.334
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    32266.96   
16384  131072
```

* Generator speed 10 Kpps, 47614.55  

```
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 42603.19 Trans/s over 5.000 seconds ending at 1670187296.823
Interim result: 48561.10 Trans/s over 5.003 seconds ending at 1670187301.826
Interim result: 48314.54 Trans/s over 5.026 seconds ending at 1670187306.851
Interim result: 49085.91 Trans/s over 5.000 seconds ending at 1670187311.851
Interim result: 47805.56 Trans/s over 5.134 seconds ending at 1670187316.985
Interim result: 47310.30 Trans/s over 5.052 seconds ending at 1670187322.038
Interim result: 48406.67 Trans/s over 5.009 seconds ending at 1670187327.047
Interim result: 48879.45 Trans/s over 4.777 seconds ending at 1670187331.824
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    47614.55  
```

* Generator speed 1 Kpps,  51736.68

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 53401.30 Trans/s over 5.000 seconds ending at 1670187488.911
Interim result: 53403.60 Trans/s over 5.000 seconds ending at 1670187493.911
Interim result: 52775.71 Trans/s over 5.059 seconds ending at 1670187498.970
Interim result: 43747.17 Trans/s over 6.032 seconds ending at 1670187505.002
Interim result: 53008.00 Trans/s over 5.000 seconds ending at 1670187510.002
Interim result: 53726.28 Trans/s over 5.000 seconds ending at 1670187515.002
Interim result: 52858.72 Trans/s over 5.082 seconds ending at 1670187520.084
Interim result: 52855.07 Trans/s over 3.827 seconds ending at 1670187523.911
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    51736.68
```

* Generator speed 100 pps, 60188.75 

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 58919.15 Trans/s over 5.000 seconds ending at 1670187938.516
Interim result: 60847.31 Trans/s over 5.000 seconds ending at 1670187943.516
Interim result: 58861.42 Trans/s over 5.169 seconds ending at 1670187948.685
Interim result: 60157.63 Trans/s over 5.001 seconds ending at 1670187953.685
Interim result: 59222.41 Trans/s over 5.079 seconds ending at 1670187958.764
Interim result: 61444.17 Trans/s over 5.000 seconds ending at 1670187963.764
Interim result: 61044.21 Trans/s over 5.033 seconds ending at 1670187968.797
Interim result: 61134.92 Trans/s over 4.720 seconds ending at 1670187973.517
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    60188.75 
```


* Generator speed 10 pps, 62015.28   
```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 62224.88 Trans/s over 5.000 seconds ending at 1670188159.167
Interim result: 57040.59 Trans/s over 5.454 seconds ending at 1670188164.621
Interim result: 61108.29 Trans/s over 5.000 seconds ending at 1670188169.621
Interim result: 63820.67 Trans/s over 5.000 seconds ending at 1670188174.621
Interim result: 61657.00 Trans/s over 5.175 seconds ending at 1670188179.797
Interim result: 63099.18 Trans/s over 5.000 seconds ending at 1670188184.797
Interim result: 63903.99 Trans/s over 5.000 seconds ending at 1670188189.797
Interim result: 63980.66 Trans/s over 4.373 seconds ending at 1670188194.170
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    62015.28   
16384  131072
```


* Generator speed 1 pps, 64818.97

```bash
Interim result: 62157.40 Trans/s over 5.000 seconds ending at 1670188324.710
Interim result: 63898.43 Trans/s over 5.000 seconds ending at 1670188329.710
Interim result: 64112.16 Trans/s over 5.000 seconds ending at 1670188334.710
Interim result: 64940.99 Trans/s over 5.002 seconds ending at 1670188339.712
Interim result: 64818.97 Trans/s over 4.586 seconds ending at 1670188344.297
```

* No Traffic, 69758.92   

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 78377.94 Trans/s over 5.019 seconds ending at 1670188427.025
Interim result: 78092.03 Trans/s over 5.018 seconds ending at 1670188432.044
Interim result: 62797.34 Trans/s over 6.218 seconds ending at 1670188438.261
Interim result: 67849.91 Trans/s over 5.018 seconds ending at 1670188443.279
Interim result: 71396.55 Trans/s over 5.002 seconds ending at 1670188448.281
Interim result: 59510.75 Trans/s over 5.999 seconds ending at 1670188454.279
Interim result: 69213.66 Trans/s over 5.000 seconds ending at 1670188459.279
Interim result: 78474.50 Trans/s over 2.731 seconds ending at 1670188462.011
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    69758.92   
16384  131072
```
## XDP 

* Generator speed 1 mpps, 38339.72   
```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 38213.94 Trans/s over 5.964 seconds ending at 1670188573.062
Interim result: 31402.66 Trans/s over 6.085 seconds ending at 1670188579.147
Interim result: 36527.70 Trans/s over 5.048 seconds ending at 1670188584.194
Interim result: 36762.95 Trans/s over 5.000 seconds ending at 1670188589.195
Interim result: 42940.36 Trans/s over 5.003 seconds ending at 1670188594.197
Interim result: 41127.82 Trans/s over 5.220 seconds ending at 1670188599.418
Interim result: 41472.88 Trans/s over 5.000 seconds ending at 1670188604.418
Interim result: 40857.63 Trans/s over 2.685 seconds ending at 1670188607.102
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    38339.72   
16384  131072
```

* Generator speed 500 Kpps,  38341.84

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 30526.10 Trans/s over 5.345 seconds ending at 1670188706.109
Interim result: 39194.98 Trans/s over 5.000 seconds ending at 1670188711.109
Interim result: 40877.04 Trans/s over 5.000 seconds ending at 1670188716.109
Interim result: 41689.94 Trans/s over 5.000 seconds ending at 1670188721.109
Interim result: 40903.64 Trans/s over 5.096 seconds ending at 1670188726.205
Interim result: 39407.90 Trans/s over 5.190 seconds ending at 1670188731.395
Interim result: 35699.37 Trans/s over 5.519 seconds ending at 1670188736.914
Interim result: 39404.79 Trans/s over 3.850 seconds ending at 1670188740.765
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    38341.84   
16384  131072
```


* Generator speed 250 Kpps, 39323.18  

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 36571.17 Trans/s over 5.000 seconds ending at 1670188900.410
Interim result: 36230.58 Trans/s over 5.047 seconds ending at 1670188905.457
Interim result: 38980.54 Trans/s over 5.000 seconds ending at 1670188910.457
Interim result: 41218.31 Trans/s over 5.012 seconds ending at 1670188915.469
Interim result: 36792.33 Trans/s over 5.601 seconds ending at 1670188921.070
Interim result: 42223.31 Trans/s over 5.000 seconds ending at 1670188926.070
Interim result: 41705.53 Trans/s over 5.062 seconds ending at 1670188931.132
Interim result: 41475.00 Trans/s over 4.277 seconds ending at 1670188935.410
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    39323.18   
16384  131072

```

* Generator speed 100 Kpps, 41837.69  

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 42557.10 Trans/s over 5.005 seconds ending at 1670189028.660
Interim result: 42478.70 Trans/s over 5.009 seconds ending at 1670189033.669
Interim result: 39749.22 Trans/s over 5.343 seconds ending at 1670189039.012
Interim result: 41527.13 Trans/s over 5.009 seconds ending at 1670189044.021
Interim result: 42278.38 Trans/s over 5.005 seconds ending at 1670189049.026
Interim result: 41764.65 Trans/s over 5.062 seconds ending at 1670189054.087
Interim result: 42310.72 Trans/s over 5.000 seconds ending at 1670189059.087
Interim result: 42213.29 Trans/s over 4.568 seconds ending at 1670189063.655
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    41837.69   
16384  131072
```

* Generator speed 50 Kpps, 47984.93  

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 48699.34 Trans/s over 5.012 seconds ending at 1670189150.235
Interim result: 48557.86 Trans/s over 5.015 seconds ending at 1670189155.250
Interim result: 47585.10 Trans/s over 5.102 seconds ending at 1670189160.352
Interim result: 49781.62 Trans/s over 5.002 seconds ending at 1670189165.354
Interim result: 49380.26 Trans/s over 5.041 seconds ending at 1670189170.395
Interim result: 48096.62 Trans/s over 5.133 seconds ending at 1670189175.528
Interim result: 44409.06 Trans/s over 5.415 seconds ending at 1670189180.944
Interim result: 47602.34 Trans/s over 4.280 seconds ending at 1670189185.224
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    47984.93   
16384  131072
```


* Generator speed 10 Kpps, 64613.92   
```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 63504.56 Trans/s over 5.000 seconds ending at 1670189239.098
Interim result: 64733.53 Trans/s over 5.000 seconds ending at 1670189244.099
Interim result: 62199.61 Trans/s over 5.204 seconds ending at 1670189249.302
Interim result: 64601.22 Trans/s over 5.000 seconds ending at 1670189254.302
Interim result: 65695.12 Trans/s over 5.000 seconds ending at 1670189259.302
Interim result: 65753.60 Trans/s over 5.000 seconds ending at 1670189264.302
Interim result: 65730.45 Trans/s over 5.002 seconds ending at 1670189269.304
Interim result: 64801.38 Trans/s over 4.795 seconds ending at 1670189274.099
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    64613.92   
16384  131072
```

* Generator speed 1 Kpps, 61268.50  
```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 63867.56 Trans/s over 5.178 seconds ending at 1670189475.004
Interim result: 52612.42 Trans/s over 6.070 seconds ending at 1670189481.074
Interim result: 62210.66 Trans/s over 5.015 seconds ending at 1670189486.089
Interim result: 58502.33 Trans/s over 5.317 seconds ending at 1670189491.406
Interim result: 62666.19 Trans/s over 5.002 seconds ending at 1670189496.408
Interim result: 67037.15 Trans/s over 5.000 seconds ending at 1670189501.408
Interim result: 62707.70 Trans/s over 5.345 seconds ending at 1670189506.753
Interim result: 63072.90 Trans/s over 3.078 seconds ending at 1670189509.831
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.01    61268.50   
16384  131072
```

* Generator speed 100 pps, 63297.62   

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 60537.71 Trans/s over 5.554 seconds ending at 1670189661.629
Interim result: 67615.08 Trans/s over 5.018 seconds ending at 1670189666.647
Interim result: 65577.54 Trans/s over 5.155 seconds ending at 1670189671.803
Interim result: 61342.14 Trans/s over 5.345 seconds ending at 1670189677.148
Interim result: 69444.74 Trans/s over 5.000 seconds ending at 1670189682.148
Interim result: 62471.31 Trans/s over 5.558 seconds ending at 1670189687.706
Interim result: 63513.55 Trans/s over 5.111 seconds ending at 1670189692.817
Interim result: 52591.41 Trans/s over 3.257 seconds ending at 1670189696.075
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    63297.62   
16384  131072
```

*  Generator speed 10 pps, 60395.21  

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 72450.20 Trans/s over 5.000 seconds ending at 1670189868.434
Interim result: 68856.12 Trans/s over 5.261 seconds ending at 1670189873.695
Interim result: 59190.20 Trans/s over 5.817 seconds ending at 1670189879.511
Interim result: 46937.58 Trans/s over 6.305 seconds ending at 1670189885.817
Interim result: 61445.49 Trans/s over 5.000 seconds ending at 1670189890.817
Interim result: 64026.96 Trans/s over 5.000 seconds ending at 1670189895.817
Interim result: 61321.68 Trans/s over 5.221 seconds ending at 1670189901.037
Interim result: 43253.91 Trans/s over 2.397 seconds ending at 1670189903.434
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    60395.21   
16384  131072

```

*  Generator speed 1 pps, 69334.77

```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 71761.59 Trans/s over 5.016 seconds ending at 1670190232.875
Interim result: 68133.72 Trans/s over 5.266 seconds ending at 1670190238.141
Interim result: 71174.33 Trans/s over 5.000 seconds ending at 1670190243.141
Interim result: 70826.06 Trans/s over 5.025 seconds ending at 1670190248.166
Interim result: 71785.35 Trans/s over 5.003 seconds ending at 1670190253.169
Interim result: 71584.86 Trans/s over 5.014 seconds ending at 1670190258.183
Interim result: 71747.16 Trans/s over 5.000 seconds ending at 1670190263.183
Interim result: 57145.04 Trans/s over 4.710 seconds ending at 1670190267.893
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.04    69334.77 
```

* No Traffic, 71296.71 
```bash
vagrant@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 76310.96 Trans/s over 5.000 seconds ending at 1670190317.492
Interim result: 77479.31 Trans/s over 5.000 seconds ending at 1670190322.492
Interim result: 65418.23 Trans/s over 5.922 seconds ending at 1670190328.414
Interim result: 67572.59 Trans/s over 5.000 seconds ending at 1670190333.414
Interim result: 65785.65 Trans/s over 5.136 seconds ending at 1670190338.550
Interim result: 68105.29 Trans/s over 5.000 seconds ending at 1670190343.550
Interim result: 76665.81 Trans/s over 5.056 seconds ending at 1670190348.606
Interim result: 75049.47 Trans/s over 3.886 seconds ending at 1670190352.492
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    71296.71   
16384  131072

```

======

## Results

No XDP
* Generator speed 1 mpps , 27035.31 
* Generator speed 500 Kpps, 30880.03 
* Generator speed 250 Kpps, 30179.29 
* Generator speed 250 Kpps, 30179.29 
* Generator speed 100 Kpps, 31446
* Generator speed 50 Kpps, 32266.96 
* Generator speed 10 Kpps, 47614.55  
* Generator speed 1 Kpps,  51736.68
* Generator speed 100 pps, 60188.75 
* Generator speed 10 pps, 62015.28   
* Generator speed 1 pps, 64818.97
* No Traffic, 69758.92   

XDP

* Generator speed 1 mpps, 38339.72  
* Generator speed 500 Kpps,  38341.84
* Generator speed 250 Kpps, 39323.18  
* Generator speed 100 Kpps, 41837.69  
* Generator speed 50 Kpps, 47984.93  
* Generator speed 10 Kpps, 64613.92   
* Generator speed 1 Kpps, 61268.50  
* Generator speed 100 pps, 63297.62   
*  Generator speed 10 pps, 60395.21  
*  Generator speed 1 pps, 69334.77
* No Traffic, 71296.71 



Count 