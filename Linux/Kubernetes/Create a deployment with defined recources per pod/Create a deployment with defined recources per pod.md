Example deplyoment with configured recources per pod:



Creates a deplyoment with requested 0.5 CPU cores and 256 megabytes worth of RAM.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-container
        image: my-image
        resources:
          limits:
            cpu: "1"
            memory: "512M"
          requests:
            cpu: "0.5"
            memory: "256M"
```

Creates a deplyoment with maximum use of 10 CPU cores and 10 GB worth of RAM.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-container
        image: my-image
        resources:
          limits:
            cpu: "10"
            memory: "10Gi"
          requests:
            cpu: "8"
            memory: "8Gi"
```
