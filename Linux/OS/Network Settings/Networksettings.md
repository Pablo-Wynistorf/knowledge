# Set IP Address:

```bash
nano /etc/netplan/00-installer-config.yaml

#00-installer-config.yaml
network:
  ethernets:
    ens160:
      addresses:
      - 10.1.3.40/21
      nameservers:
        addresses:
        - 1.1.1.1
        - 8.8.8.8
        search: []
      routes:
      - to: default
        via: 10.1.0.1
  version: 2
```
