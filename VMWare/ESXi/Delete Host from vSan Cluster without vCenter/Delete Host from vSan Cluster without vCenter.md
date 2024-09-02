# Step 1.

Login SSH:

# Step 2.

Enter these commands:

```
esxcli vsan cluster list

#copy Sub-Cluster Master UUID

esxcli vsan cluster leave -u [UUID]
esxcli vsan cluster list

#vSAN Clustering is not enabled on this host
```

If this message shows up, everything worked well.
