# XDP Experiment Setup

```

  Cisco tRex                         Device Under Test(DUT)
  traffic generator                  with XDP programs     
  +-------------------+              +--------------------+
  |                   |              |                    |
  |              eth1 ----------------eth1                |
  |                   |              |                    |
  |                   |              |                    |
  |              eth2 ----------------eth2                |
  |                   |              |                    |
  +-------------------+              +--------------------+
 
```











Resources:

* Vagrant file - https://github.com/aojea/pytest-trex
* Network Setup - https://promwad.com/news/cisco-trex-traffic-generator