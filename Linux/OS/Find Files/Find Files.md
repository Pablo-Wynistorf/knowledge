Find file by name:

```
find / -name '$Filename'
```

Find file by ending:

```
find / -name '*.txt'
```

Find file by containing .... in text:

```bash
find / -type f -exec grep -H 'text-to-find-here' {} \;
```
