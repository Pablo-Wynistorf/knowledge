![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/KgF00XFCEqTVA9R79fsLKkFB.png)



S3 Policy:

```bash
{
    "Version": "2012-10-17",
    "Id": "Policy1621958846486",
    "Statement": [
        {
            "Sid": "UpdatedPublicReadPolicy",
            "Effect": "Allow",
            "Principal": {"CanonicalUser": "Amazon_S3_Canonical_User_ID_Placeholder"},
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::$BUCKETARN/*"
        }
    ]
}

```

Example:

```bash
{
    "Version": "2012-10-17",
    "Id": "Policy1621958846486",
    "Statement": [
        {
            "Sid": "UpdatedPublicReadPolicy",
            "Effect": "Allow",
            "Principal": {"CanonicalUser": "ca7110589b9f9101e04d3e49126d629c135507f68ac987e2b1bd34208e27ac79f880c63d70b2ea9c24098500ab52d611"},
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::test/*"
        }
    ]
}

```



![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/1x48Z6LdkZ7oM9MtW9ko7OeN.png)
