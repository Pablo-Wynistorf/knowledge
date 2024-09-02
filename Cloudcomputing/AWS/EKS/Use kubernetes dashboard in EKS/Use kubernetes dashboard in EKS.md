First you need to install the dashboard on the cluster:



Follow these instructions:

[https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/oGGvBaSAZHlT8GvPm82vpeqq.png)

As soon you get this screen show up, enter this command in your aws cli:

```yaml
aws eks get-token --cluster-name $Clustername
```

Then copy the marked part from the response:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/LsTpOdI3-oQFa-ecOKLYFZ0p.png)

Enter the token in the web gui.

Now you should be logged in.
