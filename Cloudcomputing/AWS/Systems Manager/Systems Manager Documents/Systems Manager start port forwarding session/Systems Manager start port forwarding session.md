Windows CMD Command:

```
aws ssm start-session --document-name AWS-StartPortForwardingSession --parameters portNumber="80",localPortNumber="3000" --target instance-id
```

Windows Powershell Command:

```powershell
aws ssm start-session --document-name AWS-StartPortForwardingSession --parameters '{\"portNumber\":[\"80\"], \"localPortNumber\":[\"3000\"]}' --target instance-id
```

Linux Command:

```bash
aws ssm start-session \
    --target instance-id \
    --document-name AWS-StartPortForwardingSession \
    --parameters '{"portNumber":["80"], "localPortNumber":["3000"]}'
```
