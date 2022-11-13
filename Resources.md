
## Packet Flow

https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg


## TRex 

TRex VM
https://trex-tgn.cisco.com/trex/doc/trex_vm_manual.html

TRex Vagrant
http://theenterprisestack.com/2016/09/12/build-and-run-cisco-trex-traffic-generator/

https://gist.github.com/ConradIrwin/9077440

## Setup

https://promwad.com/news/cisco-trex-traffic-generator


## Other benchmarks

Use XDP DROP
https://developer.nvidia.com/blog/accelerating-with-xdp-over-mellanox-connectx-nics/



## Tests


### XDP DROp

Linux RSS & raw , conntrack
https://blog.cloudflare.com/how-to-achieve-low-latency/

Different packet drops compared
https://blog.cloudflare.com/how-to-drop-10-million-packets/

iptables conntrack 
https://blog.cloudflare.com/conntrack-tales-one-thousand-and-one-flows/

Diable RSS 
https://serverfault.com/questions/892426/disable-nic-receive-side-scaling-hashing

The map changes dynamically according to the CPU bitmask to /sys/class/net/<dev>/queues/rx-<n>/rps_cpus. For example, if we want to make the queue use the first 3 CPUs in a 8 CPUs system, we first construct the bitmask, 0 0 0 0 0 1 1 1, to 0x7, and

    # echo 7 > /sys/class/net/eth0/queues/rx-0/rps_cpus
https://garycplin.blogspot.com/2017/06/linux-network-scaling-receives-packets.html

Disable irqbalance ?
