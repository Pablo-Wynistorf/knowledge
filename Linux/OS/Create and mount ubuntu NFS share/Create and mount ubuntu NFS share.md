# 

```
apt update && apt upgrade -y
sudo apt-get install nfs-kernel-server -y
sudo mkdir -p /srv/nfs
sudo chown nobody:nogroup /srv/nfs
sudo chmod 0777 /srv/nfs

sudo mv /etc/exports /etc/exports.bak
echo '/srv/nfs 10.1.0.0/21(rw,sync,no_subtree_check)' | sudo tee /etc/exports
sudo systemctl restart nfs-kernel-server
```

Mound NFS share in ubuntu:

```
apt update && apt upgrade -y
sudo apt install nfs-common -y
sudo mkdir -p /mnt/client_sharedfolder
sudo mount [NFS _IP]:/[NFS_export] [Local_mountpoint]

sudo nano /etc/fstab
192.168.72.136:/mnt/sharedfolder /mnt/client_sharedfolder nfs defaults 0 0
```

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/S3oUeICVI8eRuK_jeIH_8ywQ.png)
