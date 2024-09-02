Setup the serial Console before start

User-Data:

```yaml
#!/bin/bash
# Define the new password
NEW_PASSWORD="Pablo123"
# Set the password for the 'ubuntu' user
echo "ubuntu:${NEW_PASSWORD}" | chpasswd
```
