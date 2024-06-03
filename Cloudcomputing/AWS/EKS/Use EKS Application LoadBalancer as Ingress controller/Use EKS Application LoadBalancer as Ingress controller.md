First you need to install helm, aws cli, kubectl and eksctl. Also make sure to be connected to your eks cluster via kubectl.

Then run the following terraform code. Please be aware that you have to change the region and cluster name.

[create-eks-loadbalancer-role.tf](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/attachments/6Y6BVrte1rHmJpKF2oALxK8q.tf)



If that worked you just need to run the following eksctl command to connect a oidc privider with your cluster:

```yaml
eksctl utils associate-iam-oidc-provider --cluster $clustername --approve
```





Now you are done!

To use the Ingress Controller just see this dokumentation:

[EKS ALB as Ingress Controller](https://pablo.slab.com/posts/iwqusevt)
