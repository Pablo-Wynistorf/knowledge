You need the EKS Load Balancer Controller installed:

To define the Target Group attributes, use these annotatios.

This will create a Network Load Balancer. He will preserve the the real client ip and sticky sessions are enabled.

```yaml
---
apiVersion: v1
kind: Service
metadata:
  name: $SERVICENAME
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-scheme: internet-facing
    service.beta.kubernetes.io/aws-load-balancer-nlb-target-type: ip
    service.beta.kubernetes.io/aws-load-balancer-type: nlb
    service.beta.kubernetes.io/aws-load-balancer-target-group-attributes: "preserve_client_ip.enabled=true, stickiness.enabled=true"
spec:
  ports:
    - port: 80
      targetPort: 80
      protocol: TCP
  type: LoadBalancer
  selector:
    app.kubernetes.io/name: $DEPLOYMENTNAME
```

You can find all annotaions [here](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/service/annotations/).
