# AWS EC2 Setup


* Use AWS Enhanced Networking
* Use Intel 82599 VF or Elastic Network Adapter (ENA)
    * For 10Gbps use Intel 82599 VF 
    * For 25Gbps use ENA
* Use cluster Placement group

Select from the following supported instance types: 
C3, C4, D2, I2, M4 (excluding m4.16xlarge), and R3.

* Use specialised instance for network optimization 


**c5n.2xlarge - 0.472 - 25Gbps**


c5n.large 
n – Network optimization




## Configure

```bash
# bring link up
sudo ip link set dev ens6 up
# set ip address
sudo ip addr add 198.18.1.2 dev ens6
# set promisc mode
sudo ip link set ens6 promisc on

```

### tRex

**Configure Interface**
```bash
sudo ./dpdk_setup_ports.py -i
```

```yaml
- version: 2
  interfaces: ['00:06.0', '00:07.0']
  port_info:
      - ip: 198.18.1.11
        default_gw: 198.18.1.10
      - ip: 198.18.2.11
        default_gw: 198.18.2.10

  platform:
      master_thread_id: 0
      latency_thread_id: 1
      dual_if:
        - socket: 0
          threads: [2,3]
```

**Start Server**

For python3.9+ fix
```
cd /usr/lib/x86_64-linux-gnu/
ln -s -f libc.a liblibc.a
```

Launch the TRex server in Stateless mode:

```bash
cd v3.XX
vagrant@tRex:/opt/trex/v3.00$ sudo ./t-rex-64 -i
```

Launch the TRex console

```bash
vagrant@tRex:/opt/trex/v3.00$ ./trex-console
Server Info:

Server version:   v3.00 @ STL
Server mode:      Stateless
Server CPU:       1 x Intel(R) Core(TM) i5-6360U CPU @ 2.00GHz
Ports count:      2 x 1Gbps @ 82540EM Gigabit Ethernet Controller
```

Start traffic
```
trex> start -f stl/udp_for_benchmarks.py --port 0 -m 1mpps -t packet_len=64,stream_count=1
```


### DUT

sudo echo 1 > /proc/sys/net/ipv4/ip_forward
sudo route add -net 16.0.0.0 netmask 255.0.0.0 gw 198.18.1.11
sudo route add -net 48.0.0.0 netmask 255.0.0.0 gw 198.18.2.11




### Multiple NIC issue

* same subnet public - not working
* different subnet private - not working

* same subnet public - with os route changes - Not working
https://aws.amazon.com/premiumsupport/knowledge-center/ec2-ubuntu-secondary-network-interface/

use different table for next interface
```yaml ens6 int1
network:
  version: 2
  renderer: networkd
  ethernets:
    ens6:
      addresses:
       - 198.18.1.11/16
      dhcp4: no
      routes:
       - to: 0.0.0.0/0
         via: 198.18.0.1 # Default gateway
         table: 1000
       - to: 198.18.1.11
         via: 0.0.0.0
         scope: link
         table: 1000
      routing-policy:
        - from: 198.18.1.11
          table: 1000
```

* Allow all traffic in security group - not working


* Modify trex config default gateway to subnet gateway [2 private or 1 public (need to do OS route update)]
https://groups.google.com/g/trex-tgn/c/30o7wrNwcXw
- Try iperf
https://superuser.com/questions/1682859/how-to-run-iperf3-throughput-test-for-multiple-client-interfaces-on-same-machine
Pending

* Test using trex ping 
https://trex-tgn.cisco.com/trex/doc/trex_stateless.html
See if reachability is the problem or the src and dest ips are the problem

* If ping works , the use xdp-paper script to change the src & dest ip to normal ones and check 
Ping works , changing src & dest ip to whatever doesn't work

* Try turing promisc mode on for all interface - Fail
 Its okay if not turned on , AWS NIC properties is powerful

* Source / Destination check ? -- PASS

Disable source and destination check 



### XDP in ENI issue

```bash
# set MTU with in XDP prog limit
ip link set dev <interface> mtu 3498
# Number of RX/TX queues must be half the available channels, make just 1 for 1 CPU. 2 for 2 CPU
# Must be half of number of CPU fpr this to work
ethtool -L <interface> combined 1
```



## Resources

[AWS Enhanced Networking](https://aws.amazon.com/premiumsupport/knowledge-center/enable-configure-enhanced-networking/)

[AWS Placement group](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)

[XDP on AWS](https://trying2adult.com/what-is-xdp-and-how-do-you-use-it-in-linux-amazon-ec2-example/)

[AWS Elastic network interfaces](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html)

[AWS EC2 Bridge Networking](https://yurmagccie.wordpress.com/2019/08/13/aws-networking-part-2-bridging-and-routing/)

[100Gpbs of Network bandwidth in AWS](https://aws.amazon.com/about-aws/whats-new/2018/11/introducing-amazon-ec2-c5n-instances/)

[AWS Network Performance](https://toonk.io/aws-network-performance-deep-dive/index.html)

[NICs  Receiving Data](https://blog.packagecloud.io/monitoring-tuning-linux-networking-stack-receiving-data/)

November 30, 2022, 17:59:59 (UTC-06:00)