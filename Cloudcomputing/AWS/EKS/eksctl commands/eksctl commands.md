List of basic eksctl commands and their meaning:



Create EKS Cluster with a nodegroup, and subnet association.

```
eksctl create cluster --name <cluster-name> --version <version> --region <region> --nodegroup-name <node-group-name> --node-type <node-type> --nodes <number-of-nodes> --nodes-min <minimum-number-of-nodes> --nodes-max <maximum-number-of-nodes> --node-ami <AMI-id> --vpc-public-subnets <subnet-1,subnet-2,subnet-3>
```

Attach a OIDC Provider to the cluster:

```
eksctl utils associate-iam-oidc-provider --region <region> --cluster <cluster-name> --approve
```
