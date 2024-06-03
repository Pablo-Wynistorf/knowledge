Then create the cluster prod Issuer:

```yaml
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: $email
    privateKeySecretRef:
      name: letsencrypt-prod
    solvers:
      - http01:
          ingress:
            class: nginx
```

(Optional) Also you can deploy a staging issuer:

```yaml
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    email: $email
    privateKeySecretRef:
      name: letsencrypt-staging
    solvers:
      - http01:
          ingress:
            class: nginx
```



Then you can create the ingress:

```yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  namespace: loginapp
  name: loginapp-ingress
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-prod
    acme.cert-manager.io/http01-edit-in-place: "true"
spec:
  ingressClassName: nginx
  rules:
    - host: login.onedns.ch
      http:
        paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: loginapp-app-svc
              port:
                number: 8080
  tls:
  - hosts:
    - login.onedns.ch
    secretName: login-onedns-ch-tls
```
