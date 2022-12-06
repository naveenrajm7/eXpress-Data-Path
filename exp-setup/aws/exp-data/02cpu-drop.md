
## Linux DROP

 mpstat -u -I SUM -P 0,1 3 5

### 500kpps

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:       0    0.00    0.00    0.00    0.00    0.00   19.71    0.10    0.00    0.00   80.19
Average:       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00


### 1mpps

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:       0    0.00    0.00    0.07    0.00    0.00   52.85    0.00    0.00    0.00   47.09
Average:       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

### 2 mpps

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:       0    0.00    0.00    0.06    0.00    0.00   94.30    0.00    0.00    0.00    5.64
Average:       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

### 3 mpps

04:50:21     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
04:50:24       0    0.00    0.00    0.00    0.00    0.00   52.88    0.00    0.00    0.00   47.12
04:50:24       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

### 4 mpps

04:51:46     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
04:51:49       0    0.00    0.00    0.00    0.00    0.00   52.43    0.00    0.00    0.00   47.57
04:51:49       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00


### 5 mpps

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:       0    0.00    0.00    0.00    0.00    0.00   97.53    0.07    0.00    0.00    2.41
Average:       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00


### 7 mpps

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:       0    0.00    0.00    0.00    0.00    0.00  100.00    0.00    0.00    0.00    0.00
Average:       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

## XDP_DROP


### 500kpps

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:       0    0.00    0.00    0.07    0.00    0.00    3.45    0.00    0.00    0.00   96.48
Average:       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00


Average:     CPU    intr/s
Average:       0  37256.60
Average:       1      1.13

### 1mpps

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:       0    0.00    0.00    0.00    0.00    0.00    6.93    0.00    0.00    0.00   93.07
Average:       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

Average:     CPU    intr/s
Average:       0  49040.20
Average:       1      0.93

### 2 mpps

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:       0    0.00    0.00    0.00    0.00    0.00    8.18    0.00    0.00    0.00   91.82
Average:       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

Average:     CPU    intr/s
Average:       0  50389.20
Average:       1      0.87

### 3mpps

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:       0    0.00    0.00    0.00    0.00    0.00    7.57    0.00    0.00    0.00   92.43
Average:       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

### 4mpps

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:       0    0.00    0.00    0.00    0.00    0.00   22.48    0.00    0.00    0.00   77.52
Average:       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

Average:     CPU    intr/s
Average:       0  23929.07
Average:       1      0.73

### 5mpps


Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:       0    0.00    0.00    0.00    0.00    0.00   24.14    0.00    0.00    0.00   75.86
Average:       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

### 7mpps

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:       0    0.00    0.00    0.00    0.00    0.00    8.10    0.00    0.00    0.00   91.90
Average:       1    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

Average:     CPU    intr/s
Average:       0  10071.20
Average:       1      0.80