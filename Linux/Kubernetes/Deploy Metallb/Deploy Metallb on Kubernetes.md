First you  need to get the latest version of metallb. You can get it here:

[https://metallb.universe.tf/installation/](https://metallb.universe.tf/installation/)

On the top left you can see the latest version:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/rNf5hWGcmP41smgYP7IBW1bO.png)







Then you can apply this manifest. You need to set the latest version before apply:

```
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/$version/config/manifests/metallb-native.yaml

#EXAMPLE:
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.11/config/manifests/metallb-native.yaml
```

After that you need to create a ipaddresspool. In that you define what ipranges can be used to assign to a svc.

```
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: ipAddressPool1
  namespace: metallb-system
spec:
  addresses:
  - 192.168.10.0/24
  - 10.2.1.10-10.2.1.20
```

Then you can apply that:

```
kubectl apply -f ipAddressPool.yaml
```

After that you have to create a L2Advertisement ressource:

```
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: ipPoolL2Advertisement
  namespace: metallb-system
spec:
  ipAddressPools:
  - ipAddressPool1
```

Then you can apply that also:

```
kubectl apply -f ipPoolL2Advertisement.yaml
```

Now if you create a service with type loadbalancer he should get a public ip in the before defined ip range.
