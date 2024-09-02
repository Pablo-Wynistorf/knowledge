First you need to install a metric server. Watch [here](https://pablo.slab.com/posts/kubernetes-metric-service-9o8bxtc3).

Next you need a deployment like this, with defined recources per pod. It uses a maximum of 0.05 CPU cores and 150 megabytes of RAM.

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  namespace: my-app
  name: my-app
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: my-app
  replicas: 5
  template:
    metadata:
      labels:
        app.kubernetes.io/name: my-app
    spec:
      containers:
      - image: nginx:latest
        imagePullPolicy: Always
        name: my-app-nginx
        resources:
          requests:
            cpu: "40m"
            memory: "100M"
          limits:
            cpu: "50m"
            memory: "150M"
```

Then you need a yaml config for the HPA:



Scales deployment, as soon as a pod reaches 60% CPU load.

```yaml
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: my-app-nginx-hpa
  namespace: my-app
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: my-app
  minReplicas: 5
  maxReplicas: 50
  targetCPUUtilizationPercentage: 60
```

Scales deployment, as soon as a pod reaches 100Mi RAM usage:

```yaml
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: my-app-nginx-hpa
  namespace: my-app
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: my-app
  minReplicas: 5
  maxReplicas: 50
  metrics:
  - type: Resource
    resource:
      name: memory
      target:
        type: Value
        value: 100Mi
```

Scales deployment, as soon as the average CPU load exeeds 50%.

```yaml
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: my-app-nginx-hpa
  namespace: my-app
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: my-app
  minReplicas: 5
  maxReplicas: 50
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
```

Scales deployment, as soon as the average RAM utilization exeeds 80%.

```yaml
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: my-app-nginx-hpa
  namespace: my-app
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: my-app
  minReplicas: 5
  maxReplicas: 50
  metrics:
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 80
```
