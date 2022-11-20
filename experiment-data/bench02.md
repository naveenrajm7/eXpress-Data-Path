# Runs

**TRex command**

```bash
trex> start -f stl/udp_for_benchmarks.py --port 0 -m XXkpps -t packet_len=64,stream_count=1
```

## Linux : iptables raw drop CPU usage

**1mpps**
Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    3.81    0.00    0.79    0.16    0.00   23.91    0.00    0.00    0.00   71.33
Average:       0    3.81    0.00    0.79    0.16    0.00   23.91    0.00    0.00    0.00   71.33

Average:     CPU    intr/s
Average:     all  12303.88
Average:       0  12304.00


**100kpps**

```bash
Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    4.27    0.00    0.85    0.13    0.00   28.21    0.00    0.00    0.00   66.54
Average:       0    4.27    0.00    0.85    0.13    0.00   28.21    0.00    0.00    0.00   66.54

Average:     CPU    intr/s
Average:     all  13322.46
Average:       0  13322.16
```

**90kpps**

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    3.65    0.00    1.08    0.04    0.00   23.99    0.00    0.00    0.00   71.24
Average:       0    3.65    0.00    1.08    0.04    0.00   23.99    0.00    0.00    0.00   71.24

Average:     CPU    intr/s
Average:     all  12567.79
Average:       0  12567.26

**80kpps**

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    3.01    0.00    0.73    0.10    0.00   19.06    0.00    0.00    0.00   77.10
Average:       0    3.01    0.00    0.73    0.10    0.00   19.06    0.00    0.00    0.00   77.10

Average:     CPU    intr/s
Average:     all  10430.03
Average:       0  10429.53

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    3.44    0.00    0.96    0.07    0.00   22.26    0.00    0.00    0.00   73.26
Average:       0    3.44    0.00    0.96    0.07    0.00   22.26    0.00    0.00    0.00   73.26

Average:     CPU    intr/s
Average:     all  11241.52
Average:       0  11241.58

**70kpps**

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    2.71    0.00    0.65    0.06    0.00   17.19    0.00    0.00    0.00   79.39
Average:       0    2.71    0.00    0.65    0.06    0.00   17.19    0.00    0.00    0.00   79.39

Average:     CPU    intr/s
Average:     all   8918.83
Average:       0   8918.80

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    2.56    0.00    0.91    0.09    0.00   15.00    0.00    0.00    0.00   81.44
Average:       0    2.56    0.00    0.91    0.09    0.00   15.00    0.00    0.00    0.00   81.44

Average:     CPU    intr/s
Average:     all   7484.92
Average:       0   7484.92

**60kpps**

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    2.64    0.00    0.68    0.09    0.00   16.12    0.00    0.00    0.00   80.46
Average:       0    2.64    0.00    0.68    0.09    0.00   16.12    0.00    0.00    0.00   80.46

Average:     CPU    intr/s
Average:     all   8275.34
Average:       0   8275.34

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    2.56    0.00    0.65    0.06    0.00   15.58    0.00    0.00    0.00   81.16
Average:       0    2.56    0.00    0.65    0.06    0.00   15.58    0.00    0.00    0.00   81.16

Average:     CPU    intr/s
Average:     all   7404.68
Average:       0   7404.70

**50kpps**

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    2.12    0.00    0.71    0.05    0.00   12.09    0.00    0.00    0.00   85.03
Average:       0    2.12    0.00    0.71    0.05    0.00   12.09    0.00    0.00    0.00   85.03

Average:     CPU    intr/s
Average:     all   6254.27
Average:       0   6254.27

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    2.27    0.00    0.85    0.05    0.00   11.86    0.00    0.00    0.00   84.97
Average:       0    2.27    0.00    0.85    0.05    0.00   11.86    0.00    0.00    0.00   84.97

Average:     CPU    intr/s
Average:     all   5558.78
Average:       0   5558.78

**40kpps**

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    1.75    0.00    0.46    0.08    0.00   10.69    0.00    0.00    0.00   87.03
Average:       0    1.75    0.00    0.46    0.08    0.00   10.69    0.00    0.00    0.00   87.03

Average:     CPU    intr/s
Average:     all   6230.01
Average:       0   6229.90

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    1.79    0.00    0.56    0.05    0.00   10.47    0.00    0.00    0.00   87.14
Average:       0    1.79    0.00    0.56    0.05    0.00   10.47    0.00    0.00    0.00   87.14

Average:     CPU    intr/s
Average:     all   5345.29
Average:       0   5345.29

**30kpps**

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    1.46    0.00    0.31    0.07    0.00    9.11    0.00    0.00    0.00   89.05
Average:       0    1.46    0.00    0.31    0.07    0.00    9.11    0.00    0.00    0.00   89.05

Average:     CPU    intr/s
Average:     all   4612.77
Average:       0   4612.77

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    1.51    0.00    0.48    0.05    0.00    9.28    0.00    0.00    0.00   88.69
Average:       0    1.51    0.00    0.48    0.05    0.00    9.28    0.00    0.00    0.00   88.69

Average:     CPU    intr/s
Average:     all   4802.75
Average:       0   4802.75

**20kpps**

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    1.27    0.00    0.32    0.08    0.00    7.28    0.00    0.00    0.00   91.04
Average:       0    1.27    0.00    0.32    0.08    0.00    7.28    0.00    0.00    0.00   91.04

Average:     CPU    intr/s
Average:     all   3405.78
Average:       0   3405.78

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    1.35    0.00    0.30    0.08    0.00    7.50    0.00    0.00    0.00   90.77
Average:       0    1.35    0.00    0.30    0.08    0.00    7.50    0.00    0.00    0.00   90.77

Average:     CPU    intr/s
Average:     all   3329.40
Average:       0   3329.40

**10kpps**

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    1.04    0.00    0.25    0.05    0.00    6.55    0.00    0.00    0.00   92.10
Average:       0    1.04    0.00    0.25    0.05    0.00    6.55    0.00    0.00    0.00   92.10

Average:     CPU    intr/s
Average:     all   1816.18
Average:       0   1816.18

Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    1.13    0.00    0.22    0.05    0.00    6.21    0.00    0.00    0.00   92.39
Average:       0    1.13    0.00    0.22    0.05    0.00    6.21    0.00    0.00    0.00   92.39

Average:     CPU    intr/s
Average:     all   1692.82
Average:       0   1692.82

------


100kpps , iptables route drop

mpstat
mpstat -u -I SUM -P ALL 10 6
```bash
Average:     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
Average:     all    4.34    0.00    1.15    0.09    0.00   27.87    0.00    0.00    0.00   66.55
Average:       0    4.34    0.00    1.15    0.09    0.00   27.87    0.00    0.00    0.00   66.55

Average:     CPU    intr/s
Average:     all  13260.69
Average:       0  13260.66
```


===========

## XDP 