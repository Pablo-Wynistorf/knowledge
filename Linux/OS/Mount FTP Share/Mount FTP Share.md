```bash
apt update && apt upgrade -y
apt install curlftpfs -y

curlftpfs [Share Hostname] /[Mountpoint] -o user=[username]:[PW],allow_other 
#mount share to specfic dir
```

Always mount after reboot:

```bash
crontab -e
@reboot curlftpfs [Share Hostname] /[Mountpoint] -o user=[username]:[PW],allow_other 
#copy command in crontab file
```
