1.) Go to a Load Balancer in the EC2 Console:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/0DcUNGD746_PTWNICN6j_K-S.png)

2.) Create a Load balancer

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/rn-CeCTVQplI3NTP_zWpPmJw.png)

3.) Choose Application Load Balancer and click create

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/wFgVRbNYGu_JvA-M7sIn4ZNE.png)

4.) Enter a name and select Internet-Facing Load Balancer

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/vJWJab-UHduCL7XkvII1seds.png)

5.) Choose your VPC and select two AZs in which your Instance oder Application is

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/TsJ-2ONneAvOsZznVJuEVntF.png)

6.) Select or create a Security Group which allows traffik to your application or ec2 instance. In my case it allows everything, because the ec2 instance has its own security group.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/JOsEK1BFxGmsNnKVl2YqXCku.png)

7.) Listeners and Routing: Create a target group first. Click on create target group.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/ow1p7I6xK1Pnzdcrn6VJV1j4.png)

8.) In my case with a EC2 Instance select Instance

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/qVgQVcCrPvoGajeVQcqE4IJF.png)

9.) Enter a target group name and select the target port. In my case its 3001 because my application on the ec2 runs on this port. But you can inject what ever port your application is using. Always select HTTP unless your application uses port 443 with TLS encryption.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/0kYJfkYG_nVZso1nGxJfpwWo.png)

10.) Enter health checks: In my case its /dashboard

If you use only "/" at the beginning it will check on the root index.html file.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/eRGorqEst2V6bf5bBmlt2-KE.png)

11.) Press Next

12.) Select your Instance and click include as pending below with the correct application port.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/LMGeAENFnhLHj28l9mNIIm5K.png)

13.) If it looks like this, click Create target group

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/lYGlxczYMRNfu9yn9ZOoEFTs.png)

It should look something like this:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/VdAdI25bgy_aGX0sAj4h_FMf.png)

14.) If you want to make your website secure with a SSL Cert select HTTPS and select your freshly created target group.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/mibIMlFI_h6qPXPBpV2GMXt8.png)

15.) Under secure listener settings select your SSL certificate.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/ypdTsZ3rnahDOeUtAlEpqFRq.png)

16.) Click create Load Balancer

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/TEs7WCYblsviYLzd5DvUchQ9.png)

17.) Wait until the state changes to Active

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/UQ3TvDDSPuLX9WopBmKQeigM.png)

18.) Select the Load Balancer

19.) Add another listener

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/zRdA9f6q7eghuIPbK7a7bgYg.png)

20.) Select HTTP, click "add action" and select "Redirect"

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/tL0_5mVmjPhyMD462H5q93CC.png)

21.) Use as redirect protocol HTTPS with port 443. And select Original host, path, query. After that click "Add" at the bottom of the page.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/WWrLxoxX8G5ucLiH5XBSJPWT.png)

It should look something like this:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/4Pa9P8tfPwzzqKleVNOYb73e.png)

22.) Copy the DNS name

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/f6Bvoxc65UTDTnIEiLA-lCb0.png)

23.) Logon to your DNS provider and create a CNAME record with your wanted domain. And enter as target your copied Load Balancer DNS name

Like this:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/_30nrAvwKR54-MHWDSVXeiYo.png)

24.) And your done. The SSL Certificate should be issued by Amazon.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/KmWuypXXUFbEYKEqlJ-VyXOa.png)







Extra: If you want to use multiple EC2 instances as webserver and load balance them. Just add another host into the target group from before. Make sure the EC2 instance is in a selected availability zone of the Load Balancer

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/Kv42W_wXCtEErmmWJvNubKPb.png)

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/z8-9Ijg_jsz0cmGfsHKkFoS8.png)
