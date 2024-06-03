Here are a couple config files for Ingressroutes using this ingress controller:

Be aware that this ingress roule will only work, if the IAM Roles are configured correctly and the EKS Subnet have the right tags.

The needed subnet tags are:

```yaml
KEY:                                                          VALUE:
kubernetes.io/role/internal-elb                               1
kubernetes.io/role/elb                                        1
```

```yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  namespace: $Namespace
  name: $Ingressroute-name
  annotations:
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
    alb.ingress.kubernetes.io/listen-ports: '[{"HTTP": 80}, {"HTTPS": 443}]'
    alb.ingress.kubernetes.io/ssl-redirect: '443'
    alb.ingress.kubernetes.io/certificate-arn: $SSL-CertARN
    alb.ingress.kubernetes.io/ssl-policy: ELBSecurityPolicy-2016-08
spec:
  ingressClassName: alb
  rules:
    - host: $Ingress-Domain
      http:
        paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: $Backend-Service-Name
              port:
                number: 80
```

This







Here you find all possible annotations:

## Annotations[¶](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#annotations)

| Name | Default | Type | Location |
| --- | --- | --- | --- |
| [alb.ingress.kubernetes.io/load-balancer-name](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#load-balancer-name) | N/A | string | Ingress |
| [alb.ingress.kubernetes.io/group.name](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#group.name) | N/A | string | Ingress |
| [alb.ingress.kubernetes.io/group.order](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#group.order) | 0 | integer | Ingress |
| [alb.ingress.kubernetes.io/tags](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#tags) | N/A | stringMap | Ingress,Service |
| [alb.ingress.kubernetes.io/ip-address-type](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#ip-address-type) | ipv4 | ipv4 | dualstack | Ingress |
| [alb.ingress.kubernetes.io/scheme](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#scheme) | internal | internal | internet-facing | Ingress |
| [alb.ingress.kubernetes.io/subnets](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#subnets) | N/A | stringList | Ingress |
| [alb.ingress.kubernetes.io/security-groups](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#security-groups) | N/A | stringList | Ingress |
| [alb.ingress.kubernetes.io/customer-owned-ipv4-pool](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#customer-owned-ipv4-pool) | N/A | string | Ingress |
| [alb.ingress.kubernetes.io/load-balancer-attributes](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#load-balancer-attributes) | N/A | stringMap | Ingress |
| [alb.ingress.kubernetes.io/wafv2-acl-arn](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#wafv2-acl-arn) | N/A | string | Ingress |
| [alb.ingress.kubernetes.io/waf-acl-id](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#waf-acl-id) | N/A | string | Ingress |
| [alb.ingress.kubernetes.io/shield-advanced-protection](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#shield-advanced-protection) | N/A | boolean | Ingress |
| [alb.ingress.kubernetes.io/listen-ports](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#listen-ports) | '[{"HTTP": 80}]' | '[{"HTTPS": 443}]' | json | Ingress |
| [alb.ingress.kubernetes.io/ssl-redirect](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#ssl-redirect) | N/A | integer | Ingress |
| [alb.ingress.kubernetes.io/inbound-cidrs](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#inbound-cidrs) | 0.0.0.0/0, ::/0 | stringList | Ingress |
| [alb.ingress.kubernetes.io/certificate-arn](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#certificate-arn) | N/A | stringList | Ingress |
| [alb.ingress.kubernetes.io/ssl-policy](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#ssl-policy) | ELBSecurityPolicy-2016-08 | string | Ingress |
| [alb.ingress.kubernetes.io/target-type](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#target-type) | instance | instance | ip | Ingress,Service |
| [alb.ingress.kubernetes.io/backend-protocol](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#backend-protocol) | HTTP | HTTP | HTTPS | Ingress,Service |
| [alb.ingress.kubernetes.io/backend-protocol-version](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#backend-protocol-version) | HTTP1 | string | Ingress,Service |
| [alb.ingress.kubernetes.io/target-group-attributes](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#target-group-attributes) | N/A | stringMap | Ingress,Service |
| [alb.ingress.kubernetes.io/healthcheck-port](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#healthcheck-port) | traffic-port | integer | traffic-port | Ingress,Service |
| [alb.ingress.kubernetes.io/healthcheck-protocol](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#healthcheck-protocol) | HTTP | HTTP | HTTPS | Ingress,Service |
| [alb.ingress.kubernetes.io/healthcheck-path](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#healthcheck-path) | / | /AWS.ALB/healthcheck | string | Ingress,Service |
| [alb.ingress.kubernetes.io/healthcheck-interval-seconds](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#healthcheck-interval-seconds) | '15' | integer | Ingress,Service |
| [alb.ingress.kubernetes.io/healthcheck-timeout-seconds](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#healthcheck-timeout-seconds) | '5' | integer | Ingress,Service |
| [alb.ingress.kubernetes.io/healthy-threshold-count](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#healthy-threshold-count) | '2' | integer | Ingress,Service |
| [alb.ingress.kubernetes.io/unhealthy-threshold-count](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#unhealthy-threshold-count) | '2' | integer | Ingress,Service |
| [alb.ingress.kubernetes.io/success-codes](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#success-codes) | '200' | '12' | string | Ingress,Service |
| [alb.ingress.kubernetes.io/auth-type](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#auth-type) | none | none|oidc|cognito | Ingress,Service |
| [alb.ingress.kubernetes.io/auth-idp-cognito](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#auth-idp-cognito) | N/A | json | Ingress,Service |
| [alb.ingress.kubernetes.io/auth-idp-oidc](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#auth-idp-oidc) | N/A | json | Ingress,Service |
| [alb.ingress.kubernetes.io/auth-on-unauthenticated-request](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#auth-on-unauthenticated-request) | authenticate | authenticate|allow|deny | Ingress,Service |
| [alb.ingress.kubernetes.io/auth-scope](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#auth-scope) | openid | string | Ingress,Service |
| [alb.ingress.kubernetes.io/auth-session-cookie](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#auth-session-cookie) | AWSELBAuthSessionCookie | string | Ingress,Service |
| [alb.ingress.kubernetes.io/auth-session-timeout](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#auth-session-timeout) | '604800' | integer | Ingress,Service |
| [alb.ingress.kubernetes.io/actions.${action-name}](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#actions) | N/A | json | Ingress |
| [alb.ingress.kubernetes.io/conditions.${conditions-name}](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#conditions) | N/A | json | Ingress |
| [a](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/ingress/annotations/#target-node-labels) |  |  |  |
