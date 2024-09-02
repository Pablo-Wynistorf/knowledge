```bash
apt update && apt upgrade -y
sudo apt install nfs-client -y
sudo mkdir -p /mnt/client_sharedfolder
sudo mount [NFS _IP]:/[NFS_export] [Local_mountpoint]

sudo nano /etc/fstab
192.168.72.136:/mnt/sharedfolder /mnt/client_sharedfolder nfs defaults 0 0
```
