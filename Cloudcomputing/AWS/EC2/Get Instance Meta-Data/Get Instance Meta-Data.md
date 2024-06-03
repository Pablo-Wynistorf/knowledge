First enter this command into the instance:

IMDSv1:

```
curl http://169.254.169.254/latest/meta-data/
```







IMDSv2:

```
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/
```

The diffrence between the two versions are, that on IMDSv2 you need a token to authenticate in order to get the instance metadata. Mostly you wont need the IMDSv2
