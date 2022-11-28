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





## Resources

[AWS Enhanced Networking](https://aws.amazon.com/premiumsupport/knowledge-center/enable-configure-enhanced-networking/)

[AWS Placement group](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)

[XDP on AWS](https://trying2adult.com/what-is-xdp-and-how-do-you-use-it-in-linux-amazon-ec2-example/)