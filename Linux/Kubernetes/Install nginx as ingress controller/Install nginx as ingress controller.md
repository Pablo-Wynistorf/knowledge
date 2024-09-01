First you need to add the helm repo:

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx/
```

```
helm repo update
```

Create the namespace:

```bash
kubectl create ns ingress-nginx
```

Then you can install the helm release:

```bash
helm install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  --set rbac.create=true \
  --set controller.metrics.enabled=true \
  --set-string controller.podAnnotations."prometheus\.io/scrape"="true" \
  --set-string controller.podAnnotations."prometheus\.io/port"="10254" \
  --set controller.ingressClass.create=true \
  --set controller.replicaCount=3
```

On AWS use this command instead:

```bash
helm install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  --set rbac.create=true \
  --set controller.metrics.enabled=true \
  --set-string controller.podAnnotations."prometheus\.io/scrape"="true" \
  --set-string controller.podAnnotations."prometheus\.io/port"="10254" \
  --set controller.ingressClass.create=true \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/aws-load-balancer-scheme"=internet-facing \
  --set-string controller.service.annotations."service\.beta\.kubernetes\.io/aws-load-balancer-cross-zone-load-balancing-enabled"="true" \
  --set controller.replicaCount=3
```

This makes sure that the loadbalancer of the ingress controller is internet-facing.



Check if everything worked:

```bash
kubectl get deploy -n ingress-nginx
```

It should look like this:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/tCAEdRo5Fr-FZsoEzS0JWfyW.png)

With this command you can findout the ingress entrypoint to the cluster:

```bash
kubectl get svc -n ingress-nginx
```

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/rZJkJR5LOhdaTt6HiLpns52p.png)

These are all possible nginx ingress annotations:

[https://github.com/kubernetes/ingress-nginx/blob/main/docs/user-guide/nginx-configuration/annotations.md](https://github.com/kubernetes/ingress-nginx/blob/main/docs/user-guide/nginx-configuration/annotations.md)

t

So thats it, now you can deploy your ingress service to the cluster and don't forget the ingressClassName!

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: loginapp-frontend-dev-ingress
  namespace: loginapp
  annotations:
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
  labels:
    name: loginapp-frontend-dev-ingress
spec:
  ingressClassName: nginx
  rules:
  - host: login.dev.onedns.ch
    http:
      paths:
      - pathType: Prefix
        path: "/"
        backend:
          service:
            name: loginapp-frontend-svc
            port: 
              number: 80
  tls:
  - hosts:
    - ingress.onedns.ch
    secretName: ingress-onedns-ch-tls
```
