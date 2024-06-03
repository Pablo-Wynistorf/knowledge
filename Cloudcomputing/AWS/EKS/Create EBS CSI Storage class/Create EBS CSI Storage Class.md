Option 1:) Terraform:

[create-eks-ebs-storageclass-role.tf](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/attachments/J2Sqj1SDiCCw3-OGZEFycHnm.tf)

```yaml
terraform init
terraform apply
```



Option 2:) Manual:

First create get the oidc provider of the cluster:

```yaml
aws eks describe-cluster --name $CLUSTER_NAME --query "cluster.identity.oidc.issuer" --output text
```

An example output is as follows.

```
https://oidc.eks.region-code.amazonaws.com/id/EXAMPLED539D4633E53DE1B71EXAMPLE
```



If you do not have a oidc provider yet, use this eksctl command to create one:

```yaml
eksctl utils associate-iam-oidc-provider --region $CLUSTER_REGION --cluster $CLUSTER_NAME --approve
```

Then create a IAM role: (_`aws-ebs-csi-driver-trust-policy`_.json)

Dont forget to change the $VARIABLES

```yaml
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::$ACCOUNT_ID:oidc-provider/oidc.eks.$REGION_CODE.amazonaws.com/id/$OIDC_ID"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringLike": {
          "oidc.eks.$REGION_CODE.amazonaws.com/id/$OIDC_ID:sub": "system:serviceaccount:kube-system:ebs-csi-controller-sa",
          "oidc.eks.$REGION_CODE.amazonaws.com/id/$OIDC_ID:aud": "sts.amazonaws.com"
        }
      }
    }
  ]
}
```

```yaml
aws iam create-role --role-name AmazonEKS_EBS_CSI_DriverRole --assume-role-policy-document file://"aws-ebs-csi-driver-trust-policy.json"
```

Now attatch a the trustpolicy to the role:

```yaml
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy --role-name AmazonEKS_EBS_CSI_DriverRole
```

Then go to the cluster settings and select get more add-ons: (Ignore that is says EFS, in your case use the Amazon EBS CSI Driver Addon, also select the ebs role not the efs)

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/hiUfPs_IgH03b2EYbE0ALemH.png)

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/rTD5QnH3IBN5giVIm8mSIwG_.png)

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/8R-cj1cUxWmXO32AtlRiTTfB.png)

Select the IAM Role. Click next!

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/ebrxcTsnTBoGMszV0ZePfKdJ.png)

And at the end click create.

Now you can create the storageclass inside the kubernetes cluster:

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: ebs-sc
provisioner: kubernetes.io/aws-ebs
volumeBindingMode: WaitForFirstConsumer
parameters:
  type: gp2
  fsType: ext4
```



[https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/docs/parameters.md](https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/docs/parameters.md)



IMPORTANT:

Dont forget to allow the access from the nodes to the EFS Share with the desired security groups!
