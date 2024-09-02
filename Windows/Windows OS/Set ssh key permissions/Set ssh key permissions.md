WARNING: UNPROTECTED PRIVATE KEY FILE! error fix:

Get into the dir with the key.

Windows:
```
icacls .\$PRIVATEKEY /inheritance:r
icacls .\$PRIVATEKEY /grant:r $USERNAME:"(R)"
```

Linux:
```
chmod 700 $PRIVATEKEY
```



```yaml
icacls .\eks-nodes.pem /inheritance:r
icacls .\eks-nodes.pem /grant:r pwyni:"(R)"
```
