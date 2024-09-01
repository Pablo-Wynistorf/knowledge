Associate Identity Provider:

```yaml
eksctl utils associate-iam-oidc-provider --region <region> --cluster <cluster_name> --approve
```



First you need to create a role in iam. Click create role in iam and select "custom trust policy"

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/preload/kc-GHFdIO9OxV4kOTycyNAFB.png)

2.) Then you have to create this custom trust policy:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::899367745017:oidc-provider/oidc.eks.eu-central-2.amazonaws.com/id/A0D5FDCDC59CB93C00DA2262294E2897"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "oidc.eks.eu-central-2.amazonaws.com/id/A0D5FDCDC59CB93C00DA2262294E2897:sub": "system:serviceaccount:default:aws-iam-role"
                }
            }
        }
    ]
}
```

You need to change these values:

```
arn:aws:iam::899367745017:oidc-provider/oidc.eks.eu-central-2.amazonaws.com/id/A0D5FDCDC59CB93C00DA2262294E2897
```

```yaml
"oidc.eks.eu-central-2.amazonaws.com/id/A0D5FDCDC59CB93C00DA2262294E2897:sub": "system:serviceaccount:default:aws-iam-role"
```

You can find that here:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/preload/kKNUXpAQnBoaLBUF2pKUyrg4.png)



```
oidc.eks.eu-central-2.amazonaws.com/id/A0D5FDCDC59CB93C00DA2262294E2897:sub
```

Same location for that one, please dont forget the :sub at the end

```
system:serviceaccount:default:aws-iam-role
```

Here you need to change to the namespace where the service account lives in and the name of the service account.

3.) Then you should supply the role with the needed permissions.

4.) After thats done, you can create the service account on the eks cluster. For the role annotation, just copy the role arn from iam.

```
kubectl apply -f iam-sa.yaml
```

```yaml
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: aws-iam-role
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::899367745017:role/aws-eks-iam-role
```

Now you can use this service account on every pod you want, in the sanme namespace. Example:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: aws-iam-role-test
spec:
  serviceAccountName: aws-iam-role
  containers:
  - name: my-container
    image: ubuntu:latest
    command: ["tail", "-f", "/dev/null"]
```
