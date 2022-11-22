# Load Balancing



## Linux

IPVS Load balancer






## XDP

Facebook Katran load balancer

### Install 

git clone 

./build.sh install

./build.sh

### Running

10.70.2.2 == 192.168.254.106


./start_katran_simple_server.sh


cd build/example
./simple_katran_client -A -u 10.70.2.2:12


./simple_katran_client -u 10.70.2.2:12 -a -r 10.0.0.1
./simple_katran_client -u 10.70.2.2:12 -a -r 10.0.0.2

./simple_katran_client -l

./simple_katran_client -s

