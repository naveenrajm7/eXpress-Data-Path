#!/bin/bash

# run as root

# set hostname
hostname ${host_name}

# create trex dir
mkdir -p /opt/trex
cd /opt/trex 

# get latest trex
wget --no-cache --no-check-certificate https://trex-tgn.cisco.com/trex/release/latest

# extract trex
tar -zxvf latest 