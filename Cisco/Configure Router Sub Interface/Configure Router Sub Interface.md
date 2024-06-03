1.) Add the vlan

```
vlan database

vlan $VlanID name $VlanName
```

2.) Configure Sub Interface

```
int gi0/0/1.$VlanID

encapsulation dot1Q $VlanID
ip addr $GatewayAddress $SubnetMask
```

3.) Show config to check everything worked well:

```
sh ip int br
```

4.) It should look like this:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/eoX4jAM7ZRkqZkLjFDhzsfN9.png)
