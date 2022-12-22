## No XDP

## **Without DDOS, without XDP**

netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T1,1

```
ubuntu@xdp-DUT:~/xdp_scripts$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T2,2
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 111415.48 Trans/s over 5.188 seconds ending at 1670646646.005
Interim result: 111231.45 Trans/s over 5.008 seconds ending at 1670646651.013
Interim result: 111452.98 Trans/s over 5.000 seconds ending at 1670646656.013
Interim result: 111218.95 Trans/s over 5.011 seconds ending at 1670646661.024
Interim result: 111128.34 Trans/s over 5.004 seconds ending at 1670646666.028
Interim result: 111247.22 Trans/s over 5.000 seconds ending at 1670646671.028
Interim result: 111418.15 Trans/s over 5.000 seconds ending at 1670646676.028
Interim result: 111372.61 Trans/s over 4.789 seconds ending at 1670646680.817
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    111310.51   
16384  131072
```

### Speed 500kpps

```bash
ubuntu@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T2,2
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 109773.27 Trans/s over 5.000 seconds ending at 1670646786.627
Interim result: 109767.23 Trans/s over 5.000 seconds ending at 1670646791.627
Interim result: 109845.16 Trans/s over 5.000 seconds ending at 1670646796.627
Interim result: 110059.69 Trans/s over 5.000 seconds ending at 1670646801.627
Interim result: 110477.52 Trans/s over 5.000 seconds ending at 1670646806.627
Interim result: 110183.41 Trans/s over 5.013 seconds ending at 1670646811.641
Interim result: 110296.18 Trans/s over 5.000 seconds ending at 1670646816.641
Interim result: 110202.56 Trans/s over 4.986 seconds ending at 1670646821.627
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    110075.34   
16384  131072
```

### Speed 1mpps

```
ubuntu@xdp-DUT:~$ netperf -t TCP_RR -H 198.18.1.10 -D5 -l 40 -T2,2
MIGRATED TCP REQUEST/RESPONSE TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 198.18.1.10 () port 0 AF_INET : demo : first burst 0 : cpu bind
Interim result: 110618.56 Trans/s over 5.001 seconds ending at 1670646875.348
Interim result: 110401.09 Trans/s over 5.010 seconds ending at 1670646880.358
Interim result: 110441.38 Trans/s over 5.000 seconds ending at 1670646885.358
Interim result: 110346.37 Trans/s over 5.004 seconds ending at 1670646890.362
Interim result: 110253.15 Trans/s over 5.004 seconds ending at 1670646895.367
Interim result: 110261.00 Trans/s over 5.000 seconds ending at 1670646900.367
Interim result: 110278.74 Trans/s over 5.000 seconds ending at 1670646905.367
Interim result: 110370.28 Trans/s over 4.981 seconds ending at 1670646910.348
Local /Remote
Socket Size   Request  Resp.   Elapsed  Trans.
Send   Recv   Size     Size    Time     Rate         
bytes  Bytes  bytes    bytes   secs.    per sec   

16384  131072 1        1       40.00    110371.09   
16384  131072

```

### Speed 2 mpps

### Speed 3 mpps

### Speed 4 mpps




## XDP

## **Without DDOS, with XDP**


### 500kpps

### 1mpps

### 2mpps

