First you need to create a user in IAM.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/yIMuY89ETUgn5ButF0no7-wi.png)

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/nMHNkm7_CU37FHa4xipIWDRR.png)

Choose attach policies directly:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/hN9jFAUJj7Tw9qm7QiHzcaYZ.png)

Under permission policies type S3 in the filter:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/febnvQ0i4uXqX7w5tsSAOEWW.png)

Select full access or read only access specific for your needs. Click Next and click create User. As soon the user is created, select the user and got to the tab security credentials. Enable console access:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/sD54Qz7xMBtu5dHMTxDQDI6y.png)

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/MkmHhw8lYb82L3PZUUBAVOzM.png)



After that, scroll on the same tab down to Access keys and create a new one.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/NInAqwKB_OmdOOFlrS-S8PHX.png)

Select other and Discribe the Access Key. Save the access key and the secret and press done.

Copy on the same page the console sign-it url and open it in another browser window.

Login with the S3-Bucket user.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/rFs3Dkh4ffOk_3NsyNO0F_5o.png)

Go to S3 and create a Bucket.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/fPo2uoQ9aT_UYePSEBLLPhTY.png)



Now go to a application that is able to connect to a S3 Bucket.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/r5GVrg59BU_mxqTDNRlKEcQ9.png)

Now enter your key ID and Secret Key.

Now you should be able to connect to the bucket.

When it worked you can open the Bucket like so:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/_HanmyyoA1cWNR5SwRbUupES.png)













Go to the console sign-in url and sign-in with the new user. As soon you're logged in, go to the service S3.
