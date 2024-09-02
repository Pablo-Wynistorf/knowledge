**INFO:**  _Unless mounting the disk, every other step only needs to be done on only one instance._





1.) First you need to create the ebs volume. Select Provisioned IOPS SSD (io2). The Availability zone needs to be the same as the instance. Also enable Multi-Attach.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/gtCi7izckftx1HtY5wkaYsW5.png)

2.) Then attach the volume to the instances.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/eQdblkg1-K-kZ3k2irmqycFY.png)

3.) Go to the instance and lookup the name of the storage. In this case its  "nvme1n1"

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/B_VGpNZZEjuHQrSygbNONXI4.png)

4.) Create a new partition:

```
fdisk /dev/nvme1n1
p #print
g #create new partition table
n #use default
w #write
```

It should look like this:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/sYQZsUshxEfZRC78d5tZ_Xhf.png)

5.) Now create a filesystem on the new partition.

```
mkfs -t ext4 /dev/nvme1n1p1
```

5.) And then you can mount the disk in fstab or with the mount command.

```
mount /dev/nvme1n1p1 /volume
```
