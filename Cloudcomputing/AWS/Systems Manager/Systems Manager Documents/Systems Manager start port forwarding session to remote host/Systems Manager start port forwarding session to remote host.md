Windows CMD Command:

```bash
aws ssm start-session --document-name AWS-StartPortForwardingSessionToRemoteHost --parameters host="host.com",portNumber="3306",localPortNumber="3306" --target instance-id
```

Windows Powershell Command:

```bash
aws ssm start-session --document-name AWS-StartPortForwardingSessionToRemoteHost --parameters '{\"host\":[\"host.com\"], \"portNumber\":[\"3306\"], \"localPortNumber\":[\"3306\"]}' --target instance-id
```

Linux Command:

```bash
aws ssm start-session \
    --document-name AWS-StartPortForwardingSessionToRemoteHost \
    --parameters '{"host":["host.com"],"portNumber":["3306"], "localPortNumber":["3306"]}'
    --target instance-id \
```
