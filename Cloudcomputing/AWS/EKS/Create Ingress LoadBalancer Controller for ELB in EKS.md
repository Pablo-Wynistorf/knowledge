1.) Install the following applications on your local machine:

- Terraform
- Eksctl
- helm
- aws cli

2.) Login to your AWS Cli console.

3.) Download this Terraform code and change to your aws region:

[create-eks-loadbalancer-role.tf](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/attachments/zuin_knfIB5ulpNVKxFo4FCO.tf)

4.) Run the Terraform code. If a error comes at the end, just run the terraform again, there was probably a problem with adding the helm repo.

5.) If every thing worked succesfully run this eksctl command in your powershell and set your clustername:

```
eksctl utils associate-iam-oidc-provider --cluster $clustername --approve
```



Now you should be good to go!



See examples of the new ELB-ingressroute here.
