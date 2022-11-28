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


### DUT

sudo echo 1 > /proc/sys/net/ipv4/ip_forward
sudo route add -net 16.0.0.0 netmask 255.0.0.0 gw 198.18.1.11
sudo route add -net 48.0.0.0 netmask 255.0.0.0 gw 198.18.2.11




### Multiple NIC issue

* same subnet public - not working
* different subnet private - not working

## Resources

[AWS Enhanced Networking](https://aws.amazon.com/premiumsupport/knowledge-center/enable-configure-enhanced-networking/)

[AWS Placement group](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)

[XDP on AWS](https://trying2adult.com/what-is-xdp-and-how-do-you-use-it-in-linux-amazon-ec2-example/)