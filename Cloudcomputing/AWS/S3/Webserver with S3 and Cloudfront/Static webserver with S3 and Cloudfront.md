1.) Create a S3 Bucket. Choose the Region were the most people will see your website.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/XR3sI1sKbYoRRt4xVj-AZWcN.png)

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/0ZWuUeiVy1iKi_bcT6eWpmUY.png)

2.) Enter your freshly created bucket and go to autorisation. Go to ACL.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/eDw-GEhSRAgjFQGbFAlvU2p6.png)

Activate these two. And save changes.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/cwBYZGYsSszT7-phfH4wv4SF.png)



3.) Upload your website data.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/BT0FnOLGdvW_zM-u7nIlWRZl.png)

And set the ACL and upload.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/JfEJDYxOsKBDd9mdM1FMXhFF.png)

4.) Get a AWS Certificate on certmanager for your estimated domain

[Guide](https://pablo.slab.com/posts/request-amazon-ssl-certificate-s986616n)

5.)Go to the Cloudfront Dashboard. Click Create Distribution.

6.) Select your AWS Bucket and enter a name.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/H_C_xd5kCihD3CzZkQf7mE6n.png)

7.) Select redirect HTTP to HTTPS

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/er4RhiKdTdaOuzGHbTPM6de-.png)

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/UhAAxY-AmY_1jIkCw7muAzHk.png)

8.) Add alternative domain Name, and type in your domain and select the SSL Cert for the Domain.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/p-AdqFBbpG7dehtIA9eyO3iN.png)

9.) Enter as Default root object: index.html. Leave the rest like on the picture. And click create distribution.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/Yt3895PxybLLtZLMMiOf3GZY.png)

10.) Wait until the Status is enabled. Like so.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/hjWZblnSGIL3nndjhBIRU2J7.png)

11.) Copy the domain name which contains cloudfront.net.

12.) Go to your DNS provider and add a cname for your domain and the content as your cloudfront url. Like so.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/dLEBxCrRb4BTtnRBUpDUi_7d.png)



That easy! And there is your Bananashop with encrypted ssl cert.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/vVvB1FWk6V_V8X1fv59LzQHe.png)
