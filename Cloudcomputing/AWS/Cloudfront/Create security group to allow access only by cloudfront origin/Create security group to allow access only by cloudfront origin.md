1.) First head to your VPC Console and open Managed Prefix list:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/4W1RuqD1LfxBdFh_QhTup_OW.png)

2.) Look for the prefix list called: [pl-00b37293991dbe6a8](https://eu-central-2.console.aws.amazon.com/vpc/home?region=eu-central-2#PrefixListDetails:prefixListId=pl-00b37293991dbe6a8) and copy.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/q93OAo8DJ9DL89K9L22lph-M.png)

3.) Go to Security Groups and create a new one. In the inbound section select the port you want to let cloudfront have access to and enter as source the copied prefix list:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/8SZw5hPzCOYyF64xe2qqVilt.png)



So now you have a security group that only allows access to your ec2 instance or loadbalancer or other applications from a cloudfront origin.

AWS will update the prefix list automatically. No further steps needed.
