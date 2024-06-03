```bash
lsblk #show label
sudo growpart /dev/[disklabel] [number]
sudo resize2fs /dev/[disklabel][number]
lsblk
reboot now
```
