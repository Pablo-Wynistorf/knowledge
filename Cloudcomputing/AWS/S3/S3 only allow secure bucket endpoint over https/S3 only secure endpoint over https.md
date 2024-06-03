For that you need the following policy. Just change the bucketname. This denies all traffik which is not sent over secure transport.

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "RestrictToTLSRequestsOnly",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::$BUCKETNAME/*",
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        }
    ]
}
```
