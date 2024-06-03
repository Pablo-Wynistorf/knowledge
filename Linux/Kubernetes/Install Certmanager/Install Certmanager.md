```yaml
helm repo add jetstack https://charts.jetstack.io --force-update
```

```yaml
helm repo update
```

```yaml
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.14.4 --set installCRDs=true --set prometheus.enabled=true
```



[https://cert-manager.io/docs/installation/kubectl/](https://cert-manager.io/docs/installation/kubectl/)
