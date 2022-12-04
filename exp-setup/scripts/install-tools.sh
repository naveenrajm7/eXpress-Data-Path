#!/bin/bash
sudo apt-get update

# route : to add static routes for forwarding
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y net-tools

# conntrack : To use conntrack with iptables drop
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y conntrack

# mpstat : To measure CPU usage
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y sysstat

# iperf3 : To measure baseline band width
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y iperf3

# netperf : To test DDOS 
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y netperf
