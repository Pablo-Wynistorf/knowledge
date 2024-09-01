# Preparation:

Install

- [eksctl](https://eksctl.io/installation/)
- [helm](https://helm.sh/docs/intro/install/)
- [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [awscli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)



1.) EKS Noderole should have these Permissions:

- AmazonEKSWorkerNodePolicy
- AmazonSSMManagedInstanceCore
- AmazonEC2ContainerRegistryReadOnly
- AmazonEKS_CNI_Policy

2.) The Subnets should have these tags:

Private:

| kubernetes.io/role/internal-elb | 1 |
| --- | --- |

Public:

| kubernetes.io/role/elb | 1 |
| --- | --- |

| kubernetes.io/role/internal-elb | 1 |
| --- | --- |

3.) Launch metrics server:

```yaml
kubectl apply -f https://raw.githubusercontent.com/Pablo-Wynistorf/kubernetes-apps/main/metrics-server/metrics-server.yaml
```

```yaml
kubectl get pods -n kube-system
```

4.) Associate OIDC:

```yaml
eksctl utils associate-iam-oidc-provider --region <region> --cluster <cluster_name> --approve
```

5.) Deploy loadbalancer controller

```yaml
wget https://raw.githubusercontent.com/Pablo-Wynistorf/terraform/main/aws/create-eks-ingress-loadbalancer-role/create-eks-loadbalancer-role.tf
```

```yaml
terraform init
```

```yaml
terraform apply
```

6.) Deploy nginx ingress controller:

[Install nginx as ingress controller](https://pablo.slab.com/posts/uecq4dcg)

# Create Namespace:

```bash
kubectl create ns application
```

# Create Deployment:

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  namespace: application
  name: server01-app
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: server01-app
  replicas: 3
  template:
    metadata:
      labels:
        app.kubernetes.io/name: server01-app
    spec:
      serviceAccountName: server01-sa
      containers:
      - image: nginx:latest
        imagePullPolicy: Always
        name: server01-app
        ports:
          - containerPort: 80
        resources:
          requests:
            cpu: "50m"
            memory: "80Mi"
          limits:
            cpu: "80m"
            memory: "120Mi"
        env:
        - name: URL
          valueFrom:
            secretKeyRef:
              name: server01-secrets
              key: URL
              optional: false
        - name: DATABASE_URI
          valueFrom:
            secretKeyRef:
              name: server01-secrets
              key: DATABASE_URI
              optional: false
---
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: server01-hpa
  namespace: application
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: server01-app
  minReplicas: 3
  maxReplicas: 10
  targetCPUUtilizationPercentage: 80
```

Create Secret values:

```yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: server01-secrets
  namespace: application
stringData:
  URL: ""
  DATABASE_URI: "mongodb://root:password@loginapp-mongodb-svc.loginapp.svc:27017/"
type: Opaque
```

Create Serviceaccount:

[Use IAM Role in kubernetes deployment](https://pablo.slab.com/posts/vav5ljfa)

```yaml
---
apiVersion: v1
kind: ServiceAccount
metadata:  
  name: server01-sa
  namespace: application  
  annotations:    
    eks.amazonaws.com/role-arn: arn:aws:iam::123456789012:role/my-app-iam-role
```

Create Service:

```yaml
---
apiVersion: v1
kind: Service
metadata:
  namespace: application
  name: server01-svc
spec:
  ports:
    - port: 80
      targetPort: 80
      protocol: TCP
  type: ClusterIP
  selector:
    app.kubernetes.io/name: server01-app
```

Create ingress ressource:

HTTP:

```yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: server01-ingress
  namespace: application
  labels:
    name: server01-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx
  rules:
  - host: 'k8s-ingressn-ingressn-4b251b77d3-ed0fe117010cf8f7.elb.us-east-1.amazonaws.com'
    http:
      paths:
      - path: /server01
        pathType: Prefix
        backend:
          service:
            name: server01-svc
            port:
              number: 80
```

HTTPS:

```yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: server01-ingress
  namespace: application
  annotations:
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
    nginx.ingress.kubernetes.io/rewrite-target: /
  labels:
    name: server01-ingress
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
            name: server01-svc
            port: 
              number: 80
  tls:
  - hosts:
    - ingress.onedns.ch
    secretName: ingress-onedns-ch-tls
```
