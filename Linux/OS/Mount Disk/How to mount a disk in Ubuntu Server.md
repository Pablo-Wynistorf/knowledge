```bash
lsblk

fdisk /dev/[drivename] #start fdisk on spesific drive
p #print
g #create new partition table
n #use default
w #write
exit
mkfs.ext4 /dev/[drivename] #install ext4 Linux Filesystem

fdisk /dev/[drivename] #start fdisk on spesific drive
p #print drives to check configuration
exit

mkdir /[Directoryname] #make directory for mountpoint

mount /dev/[drivename] /[Directoryname] #mount drive on spesific directory
```



# Automatically mount disk after restart.

```bash
nano /etc/fstab #open mountfile

/dev/[drivename]    /[Directoyname]  [filesystem]  [option]  [dump]  [pass]
```

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/29MpfvP3CA7YIBYbeZxVglbo.png)
