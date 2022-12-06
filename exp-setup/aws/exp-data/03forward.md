

## Same NIC , XDP_TX

### 1C

sudo ethtool -X ens6 equal 1
sudo ethtool -L ens6 combined 1

Stream 1

```
Running XDP on dev:ens6 (ifindex:3) action:XDP_TX options:swapmac
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       1064694     0          
XDP-RX CPU      total   1064694    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   1064682     0          
rx_queue_index    0:sum 1064682    

```
### 2 C

sudo ethtool -L ens6 combined 2
sudo ethtool -X ens6 equal 2

Stream 2

```
Running XDP on dev:ens6 (ifindex:3) action:XDP_TX options:swapmac
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       1712039     0          
XDP-RX CPU      total   1712039    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   1712029     0          
rx_queue_index    0:sum 1712029    

Running XDP on dev:ens6 (ifindex:3) action:XDP_TX options:swapmac
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       1710000     0          
XDP-RX CPU      total   1710000    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   1710022     0          
rx_queue_index    0:sum 1710022    
```

### 3 C

sudo ethtool -L ens6 combined 3
sudo ethtool -X ens6 equal 3

Stream 3 

```bash
Running XDP on dev:ens6 (ifindex:3) action:XDP_TX options:swapmac
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       1057014     0          
XDP-RX CPU      1       1523422     0          
XDP-RX CPU      total   2580437    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   1057015     0          
rx_queue_index    0:sum 1057015    
rx_queue_index    1:1   1523422     0          
rx_queue_index    1:sum 1523422    

Running XDP on dev:ens6 (ifindex:3) action:XDP_TX options:swapmac
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       1056943     0          
XDP-RX CPU      1       1523323     0          
XDP-RX CPU      total   2580267    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   1056932     0          
rx_queue_index    0:sum 1056932    
rx_queue_index    1:1   1523323     0          
rx_queue_index    1:sum 1523323    

```


### 4 C

sudo ethtool -L ens6 combined 4
sudo ethtool -X ens6 equal 4

Stream 4

```
Running XDP on dev:ens6 (ifindex:3) action:XDP_TX options:swapmac
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       1880671     0          
XDP-RX CPU      1       1064531     0          
XDP-RX CPU      total   2945202    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   1880663     0          
rx_queue_index    0:sum 1880663    
rx_queue_index    1:1   1064539     0          
rx_queue_index    1:sum 1064539    

Running XDP on dev:ens6 (ifindex:3) action:XDP_TX options:swapmac
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       1877889     0          
XDP-RX CPU      1       1064372     0          
XDP-RX CPU      total   2942262    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   1877900     0          
rx_queue_index    0:sum 1877900    
rx_queue_index    1:1   1064388     0          
rx_queue_index    1:sum 1064388    

Running XDP on dev:ens6 (ifindex:3) action:XDP_TX options:swapmac
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       1878693     0          
XDP-RX CPU      1       1064941     0          
XDP-RX CPU      total   2943634    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   1878706     0          
rx_queue_index    0:sum 1878706    
rx_queue_index    1:1   1064916     0          
rx_queue_index    1:sum 1064916    

```


### 5 C

sudo ethtool -L ens6 combined 5
sudo ethtool -X ens6 equal 5

Stream 5


```
Running XDP on dev:ens6 (ifindex:3) action:XDP_TX options:swapmac
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      1       1011333     0          
XDP-RX CPU      2       997716      0          
XDP-RX CPU      3       1018800     0          
XDP-RX CPU      4       980676      0          
XDP-RX CPU      total   4008528    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    1:1   1011308     0          
rx_queue_index    1:sum 1011308    
rx_queue_index    2:2   997692      0          
rx_queue_index    2:sum 997692     
rx_queue_index    3:3   1018833     0          
rx_queue_index    3:sum 1018833    
rx_queue_index    4:4   980682      0          
rx_queue_index    4:sum 980682     

Running XDP on dev:ens6 (ifindex:3) action:XDP_TX options:swapmac
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      1       1009426     0          
XDP-RX CPU      2       1001559     0          
XDP-RX CPU      3       1020670     0          
XDP-RX CPU      4       980458      0          
XDP-RX CPU      total   4012114    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    1:1   1009426     0          
rx_queue_index    1:sum 1009426    
rx_queue_index    2:2   1001580     0          
rx_queue_index    2:sum 1001580    
rx_queue_index    3:3   1020637     0          
rx_queue_index    3:sum 1020637    
rx_queue_index    4:4   980494      0          
rx_queue_index    4:sum 980494     
```

### 6 C

sudo ethtool -L ens6 combined 6
sudo ethtool -X ens6 equal 6

Stream 6

```
Running XDP on dev:ens6 (ifindex:3) action:XDP_TX options:swapmac
XDP stats       CPU     pps         issue-pps  
XDP-RX CPU      0       252069      0          
XDP-RX CPU      1       758416      0          
XDP-RX CPU      2       370438      0          
XDP-RX CPU      3       769868      0          
XDP-RX CPU      4       622156      0          
XDP-RX CPU      5       1021445     0          
XDP-RX CPU      total   3794395    

RXQ stats       RXQ:CPU pps         issue-pps  
rx_queue_index    0:0   252069      0          
rx_queue_index    0:sum 252069     
rx_queue_index    1:1   758419      0          
rx_queue_index    1:sum 758419     
rx_queue_index    2:2   370438      0          
rx_queue_index    2:sum 370438     
rx_queue_index    3:3   769841      0          
rx_queue_index    3:sum 769841     
rx_queue_index    4:4   622141      0          
rx_queue_index    4:sum 622141     
rx_queue_index    5:5   1021445     0          
rx_queue_index    5:sum 1021445    

```


## Different NIC, XDP_REDIRECT

### 1C

sudo ethtool -X ens6 equal 1
sudo ethtool -L ens6 combined 1

Stream 1

```
ens6->ens7              1,053,629 rx/s          1,053,629 redir/s               0 err,drop/s    1,053,623 xmit/s       
ens6->ens7              1,053,626 rx/s          1,053,625 redir/s               0 err,drop/s    1,053,658 xmit/s       
ens6->ens7              1,053,797 rx/s          1,053,798 redir/s               0 err,drop/s    1,053,758 xmit/s       
ens6->ens7              1,055,038 rx/s          1,055,038 redir/s               0 err,drop/s    1,055,038 xmit/s  
```



### 2 C 
sudo ethtool -L ens6 combined 2
sudo ethtool -X ens6 equal 2

Stream 2

```
ens6->ens7              1,691,423 rx/s          1,691,423 redir/s               0 err,drop/s    1,691,367 xmit/s       
ens6->ens7              1,690,945 rx/s          1,690,945 redir/s               0 err,drop/s    1,690,992 xmit/s       
ens6->ens7              1,691,616 rx/s          1,691,616 redir/s               0 err,drop/s    1,691,592 xmit/s
```

### 3 C 
sudo ethtool -L ens6 combined 3
sudo ethtool -X ens6 equal 3

Stream 3

```
ens6->ens7              2,578,615 rx/s          2,578,611 redir/s       1,056,611 err,drop/s    1,521,986 xmit/s       
  xmit ens6->ens7       1,521,986 xmit/s        1,056,611 drop/s                0 drv_err/s         15.08 bulk-avg     
ens6->ens7              2,575,793 rx/s          2,575,794 redir/s       1,055,754 err,drop/s    1,520,053 xmit/s       
  xmit ens6->ens7       1,520,053 xmit/s        1,055,754 drop/s                0 drv_err/s         15.08 bulk-avg     
ens6->ens7              2,579,090 rx/s          2,579,089 redir/s       1,057,626 err,drop/s    1,521,419 xmit/s       
  xmit ens6->ens7       1,521,419 xmit/s        1,057,626 drop/s                0 drv_err/s         15.07 bulk-avg  
```


### 4 C 
sudo ethtool -L ens6 combined 4
sudo ethtool -X ens6 equal 4

Stream 4

```
ens6->ens7              2,618,737 rx/s          2,618,737 redir/s         544,134 err,drop/s    2,074,554 xmit/s       
  xmit ens6->ens7       2,074,554 xmit/s          544,134 drop/s                0 drv_err/s         15.59 bulk-avg     
ens6->ens7              2,620,348 rx/s          2,620,350 redir/s         547,490 err,drop/s    2,072,929 xmit/s       
  xmit ens6->ens7       2,072,929 xmit/s          547,490 drop/s                0 drv_err/s         15.59 bulk-avg     
ens6->ens7              2,620,692 rx/s          2,620,692 redir/s         550,333 err,drop/s    2,070,357 xmit/s       
  xmit ens6->ens7       2,070,357 xmit/s          550,333 drop/s                0 drv_err/s         15.59 bulk-avg  
```

### 5 C 
sudo ethtool -L ens6 combined 5
sudo ethtool -X ens6 equal 5

Stream 5

```
ens6->ens7              4,887,752 rx/s          4,887,753 redir/s       2,979,703 err,drop/s    1,908,097 xmit/s       
  xmit ens6->ens7       1,908,097 xmit/s        2,979,703 drop/s                0 drv_err/s         15.07 bulk-avg     
ens6->ens7              4,883,610 rx/s          4,883,610 redir/s       2,977,551 err,drop/s    1,906,080 xmit/s       
  xmit ens6->ens7       1,906,080 xmit/s        2,977,551 drop/s                0 drv_err/s         15.07 bulk-avg     
ens6->ens7              4,886,334 rx/s          4,886,334 redir/s       2,977,585 err,drop/s    1,908,799 xmit/s       
  xmit ens6->ens7       1,908,799 xmit/s        2,977,585 drop/s                0 drv_err/s         15.07 bulk-avg     
ens6->ens7              4,885,560 rx/s          4,885,560 redir/s       2,980,467 err,drop/s    1,904,992 xmit/s       
  xmit ens6->ens7       1,904,992 xmit/s        2,980,467 drop/s                0 drv_err/s         15.07 bulk-avg     
```

### 6 C 
sudo ethtool -L ens6 combined 6
sudo ethtool -X ens6 equal 6

Stream 6

```ens6->ens7              5,052,977 rx/s          5,052,978 redir/s       2,926,090 err,drop/s    2,126,867 xmit/s       
  xmit ens6->ens7       2,126,867 xmit/s        2,926,090 drop/s                0 drv_err/s         15.03 bulk-avg     
ens6->ens7              5,057,678 rx/s          5,057,674 redir/s       2,928,802 err,drop/s    2,128,875 xmit/s       
  xmit ens6->ens7       2,128,875 xmit/s        2,928,802 drop/s                0 drv_err/s         15.05 bulk-avg     
ens6->ens7              5,042,321 rx/s          5,042,321 redir/s       2,912,715 err,drop/s    2,129,614 xmit/s       
  xmit ens6->ens7       2,129,614 xmit/s        2,912,715 drop/s                0 drv_err/s         15.03 bulk-avg     
ens6->ens7              5,055,890 rx/s          5,055,890 redir/s       2,918,423 err,drop/s    2,137,441 xmit/s       
  xmit ens6->ens7       2,137,441 xmit/s        2,918,423 drop/s                0 drv_err/s         15.04 bulk-avg     


```