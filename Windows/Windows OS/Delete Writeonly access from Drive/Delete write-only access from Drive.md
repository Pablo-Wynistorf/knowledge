# Step 1:

Open Diskpart

# Step 2:

```
lis dis
sel dis []
attributes disk clear readonly
clean
create partition primary
sel part 1
format fs=FAT32 quick
active
exit
```
