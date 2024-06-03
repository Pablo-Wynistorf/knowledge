User Data:

```yaml
#!/bin/bash
apt update
apt install apache2 -y
systemctl start apache2
systemctl enable apache2
echo "Welcome to ClearSky hosted from $(hostname -f)" > /var/www/html/index.html
```

If you need other meta data:

This example puts the ami-id of the current instance in a index.html file

```
echo "Welcome on teh instance: $(TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/ami-id)" > /var/www/html/index.html
```

Easy version, without token:

```
echo "$(curl http://169.254.169.254/latest/meta-data/hostname)" > index.html
```
