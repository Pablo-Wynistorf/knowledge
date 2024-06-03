You can stresstest your cpu with this docker container.

ATTENTION:

The CPU-Ussage heads to 100% percent after starting the container.



You can run it with this command:

```bash
docker run -itd --name cpustress --rm containerstack/cpustress --cpu 4 --timeout 30s --metrics-brief
```

You can set the duration in timeout and the amount of cpu cores you want to use
