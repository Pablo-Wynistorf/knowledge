First you need to install helm, aws cli, kubectl and eksctl. Also make sure to be connected to your eks cluster via kubectl.

Then run the following terraform code. Please be aware that you have to change the region and cluster name.

[https://github.com/Pablo-Wynistorf/terraform/blob/main/aws/create-eks-ingress-loadbalancer-role/create-eks-loadbalancer-role.tf](https://github.com/Pablo-Wynistorf/terraform/blob/main/aws/create-eks-ingress-loadbalancer-role/create-eks-loadbalancer-role.tf)



If that worked you just need to run the following eksctl command to connect a oidc privider with your cluster:

```yaml
eksctl utils associate-iam-oidc-provider --cluster $clustername --approve
```





Now you are done!

To use the Ingress Controller just see this dokumentation:

[EKS ALB as Ingress Controller](https://pablo.slab.com/posts/iwqusevt)
