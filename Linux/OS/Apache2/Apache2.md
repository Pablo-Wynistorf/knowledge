# Sites Enabled for Server on the same Host:

```bash
<VirtualHost *:80> 
ServerName [domain] 
ServerAdmin webmaster@localhost 
DocumentRoot /var/www/[html dir] 
ErrorLog ${APACHE_LOG_DIR}/error.log 
CustomLog ${APACHE_LOG_DIR}/access.log combined 
</VirtualHost> 
```
