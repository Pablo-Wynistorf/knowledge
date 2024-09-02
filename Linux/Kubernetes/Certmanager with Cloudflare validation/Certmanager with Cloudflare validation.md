First Create the secret for the cloudflare api token:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-api-token
  namespace: cert-manager
type: Opaque
stringData:
  api-token: $API-TOKEN
```

You can get the api token in your account. Create a new token and define these settings:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/4AnRV89yqpFuFm5TklSqYhgH.png)

Then create the cluster prod Issuer:

```yaml
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: cloudflare-prod
  namespace: cert-manager
spec:
  acme:
    email: $ACME-EMAIL
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: cloudflare-prod
    solvers:
    - dns01:
        cloudflare:
          email: $CLOUDFLARE-EMAL
          apiTokenSecretRef:
            name: cloudflare-api-token
            key: api-token
```

(Optional) Also you can deploy a staging issuer:

```yaml
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: cloudflare-staging
  namespace: cert-manager
spec:
  acme:
    email: $ACME-EMAIL
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: cloudflare-staging
    solvers:
    - dns01:
        cloudflare:
          email: $CLOUDFLARE-EMAL
          apiTokenSecretRef:
            name: cloudflare-api-token
            key: api-token
```



Then you can create the ingress:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx-ingress
  namespace: pablo-dev-test
  annotations:
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
    cert-manager.io/cluster-issuer: cloudflare-prod #or staging
  labels:
    name: nginx-ingress
spec:
  ingressClassName: nginx
  rules:
  - host: $DOMAIN
    http:
      paths:
      - pathType: Prefix
        path: "/"
        backend:
          service:
            name: nginx-svc
            port: 
              number: 80
  tls:
  - hosts:
    - $DOMAIN
    secretName: $DOMAIN-tls
```
