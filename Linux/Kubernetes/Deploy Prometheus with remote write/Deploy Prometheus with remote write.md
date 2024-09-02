1.) First you need to create the namespace:

```
kubectl create ns monitoring
```

2.) Then you need to create a file called values.yml

```yaml
server:
  global:
    scrape_interval: 30s
  remoteWrite:
  - url: "https://prometheus-blocks-prod-us-central1.grafana.net/api/prom/push"
    basic_auth:
      username: "YOUR_GRAFANA_USERNAME"
      password: "YOUR_GRAFANA_TOKEN"
  persistentVolume:
    enabled: false
  persistentVolumeClaim:
    enabled: false
alertmanager:
  enabled: false
prometheus-pushgateway:
  enabled: false
```

You can find your username and password [here](https://grafana.com/orgs/pwynistorf/hosted-metrics/176671).

3.) Then you can install it:

```yaml
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```

```yaml
helm repo update
```

```yaml
helm install prometheus prometheus-community/prometheus -n monitoring -f values.yml
```
