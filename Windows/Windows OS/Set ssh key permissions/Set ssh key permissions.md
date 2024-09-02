WARNING: UNPROTECTED PRIVATE KEY FILE! error fix:

Get into the dir with the key.

```
icacls .\$PRIVATEKEY /inheritance:r
icacls .\$PRIVATEKEY /grant:r $USERNAME:"(R)"
```



```yaml
icacls .\eks-nodes.pem /inheritance:r
icacls .\eks-nodes.pem /grant:r pwyni:"(R)"
```
