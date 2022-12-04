#!/bin/bash

cd ~
git clone https://gist.github.com/c00abf12e7cb814f74200dc40246c1e8.git xdp_scripts
cd xdp_scripts
chmod +x read_route_table.sh ethtool_stats.pl  mmwatch