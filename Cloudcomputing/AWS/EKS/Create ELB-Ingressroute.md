First install the ELB Ingresscontroller on your EKS Cluster.



All Annotations: [Link](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/)



1.) Create a ssl certificate for a domain.

2.) Create a ingressroute like this example yaml:

```yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  namespace: <namespace name>
  name: <ingress route name>
  annotations:
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
    alb.ingress.kubernetes.io/listen-ports: '[{"HTTP": 80}, {"HTTPS": 443}]'
    alb.ingress.kubernetes.io/ssl-redirect: '443'
    alb.ingress.kubernetes.io/certificate-arn: <ssl certificate arn>
    alb.ingress.kubernetes.io/ssl-policy: ELBSecurityPolicy-2016-08
spec:
  ingressClassName: alb
  rules:
    - host: <domain>
      http:
        paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: <target service>
              port:
                number: 80
```
