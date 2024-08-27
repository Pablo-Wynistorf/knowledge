**Create the ssh key in the .ssh folder:**

```bash
ssh-keygen -t rsa -b 4096
```

**Add the Public Key to `authorized_keys`:**

- Append the contents of `id_rsa.pub` to the `authorized_keys` file:

```bash
cat id_rsa.pub >> authorized_keys
```

**Dont forget to copy out the private key to your client machine!**

**Unmount the Volume:**

- Unmount the volume from the current server:

```bash
umount /volume
```



**Reattach the Volume and Restart the Instance:**

- Reattach the volume to the original EC2 instance as its root volume.
- Start the instance if it is not already running.

**Connect Using the New SSH Key:**

- Use the new private key (`id_rsa`) to SSH into the instance as the `ubuntu` user:

```bash
ssh -i /path/to/id_rsa ubuntu@your-ec2-instance-public-ip
```



- Replace `/path/to/id_rsa` with the path where you have securely stored the private key file.
