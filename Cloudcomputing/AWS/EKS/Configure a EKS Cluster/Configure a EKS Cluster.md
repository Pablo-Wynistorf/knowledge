1. Create a VPC for your cluster. And add Security Groups and an ssh key. 

Create it by hand or use this Terraform file:

[create-ecs-vpc.tf](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/attachments/NebyWd0gUDVvy8hZOI5GnMOK.tf)



1. Set Cluster name and Version:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/mqyYmSkr54oxSPpAtw_F1Ujd.png)

1. Select the VPC, Subnet and Security groups.

I recommend to add a security group, which allows all connection by a security group. In case you want to use a DB or some sort of other external services.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/Uu7wwcG8KsGFFRQGbKAsYx-N.png)

3. Select private endpoint access and click next.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/wJK14MbprnGF-lrEeT-Clmsf.png)

4.) Configure the logging for your needs and then click next.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/CZQv-BkxECnx-mHWCwJu3TGC.png)

5.) Click next

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/p7wm3StXrJOlN_nZfghq4xmP.png)

6.) Select the versions for your special needs. In my case its all latest

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/7lszrWUlBbOg_z4DBSpxzbRk.png)

7.) Check your configuration, if everything is configured correctly you can click create cluster.

8.) Now install AWS Cli:

[https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

9.) After the installation enter a powershell prompt and type `aws configure`	and enter your credentials.

10.)Install Kubectl for windows:

[https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)

11.) As soon the cluster is in active state, you can add a node group under the tab compute:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/33vYQULpjfyUc1_HkPZUUcI9.png)

12.) Enter a Name and a IAM role. After that add tags and click next.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/pgL-MQwgVaxbg4f52iKi_YpH.png)

13.) Configure the AMI type, select a Instance type and the disk Size.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/lKWC4rf2ibKg2Udj9PtKS6_p.png)

14.) Configure the node group scaling. We used 6 Subnets in the cluster. Because of this i want to use 6 nodes at minimum.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/08v5zhSNIAiZpdDalLfatDag.png)

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/54_w5XoTStXErQ5PYMdXnGcM.png)

15.) Specify the subnets, where the nodes should be placed at. Also select "ssh access enabled". Use a matching Security Group. With this function you can update the nodes. Press next.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/7DM5wpAXqIWcVtOdOX94Fb2d.png)

16.) Check your configuration, if everything is configured right, click Create. Wait until all nodes joined the cluster.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/AWzEVcytxtgCMWQy7GO8tzIl.png)

17.) Configure kubectl on your windows machine. Enter a PowerShell prompt and type in:

```powershell
aws eks --region $Clusterregion update-kubeconfig --name $clustername
```

The output should be similar to this:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/PqI9Tld1ubjhxM3vfM7WMKHG.png)

18.) To configure the cluster, you must set the API endpoint access to Public.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/Jhol4E29dvkX9yEdJJDc6LlM.png)

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/ie_lItxBJI_wponWWxXGQgtN.png)



19.) Now should be everything configured correctly. To check, enter the following command into you powershell:

```powershell
kubectl get nodes -o wide
```

If the output looks similar to this, your cluster is configured correctly.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/P0IB0xXT6gy9-7in2WCiE3Zl.png)



20.) It is recommended to set the cluster to private again, as soon the application has been deployed.
