You have two options to deploy a NAT gateway instance on EC2.

The first and best option is to just deploy this terraform script, and enter the instance id printed out at the end in the route table of the private subnet.

[https://raw.githubusercontent.com/Pablo-Wynistorf/terraform/main/aws/create-ec2-nat-instance/create-ec2-nat-instance.tf](https://raw.githubusercontent.com/Pablo-Wynistorf/terraform/main/aws/create-ec2-nat-instance/create-ec2-nat-instance.tf)



Or you can do it manual:

1.) Use the amazon ami

2.) Create a security group that allows ingress from the vpc cidr

3.) Create the instance in a public subnet

4.) Use this instance cloud init:

```
#!/bin/bash
sudo yum install iptables-services -y
sudo systemctl enable iptables
sudo systemctl start iptables
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.d/custom-ip-forwarding.conf
sudo sysctl -p /etc/sysctl.d/custom-ip-forwarding.conf
iface=$(netstat -i | grep "BMRU" | awk '{print $1}')
sudo /sbin/iptables -t nat -A POSTROUTING -o $iface -j MASQUERADE
sudo /sbin/iptables -F FORWARD
sudo service iptables save
```

5.) Enable Stop Source/Destination checks and click save

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/yGLMiLszQQ-jms8KL2RBcrO4.png)

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/WEKp2Q4reRor4u17VUsJJvzo.png)
