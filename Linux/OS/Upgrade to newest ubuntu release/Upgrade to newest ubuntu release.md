1.) Update the resource list. Get the current Source List from this URL: [https://wiki.ubuntuusers.de/sources.list/](https://wiki.ubuntuusers.de/sources.list/)

2.) Copy the lines from your wanted ubuntu version:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/_axFsyJT7PNrkUzK1N1287Qt.png)

3.) Rename the old release file:

```
mv /etc/apt/sources.list /etc/apt/sources.list.old
```

4.) Copy the lines in the file /etc/apt/sources.list

```
nano /etc/apt/sources.list

deb http://de.archive.ubuntu.com/ubuntu kinetic main restricted universe multiverse
#deb-src http://de.archive.ubuntu.com/ubuntu kinetic main restricted universe multiverse

deb http://de.archive.ubuntu.com/ubuntu kinetic-updates main restricted universe multiverse
#deb-src http://de.archive.ubuntu.com/ubuntu kinetic-updates main restricted universe multiverse

deb http://de.archive.ubuntu.com/ubuntu kinetic-security main restricted universe multiverse
#deb-src http://de.archive.ubuntu.com/ubuntu kinetic-security main restricted universe multiverse

deb http://de.archive.ubuntu.com/ubuntu kinetic-backports main restricted universe multiverse
#deb-src http://de.archive.ubuntu.com/ubuntu kinetic-backports main restricted universe multiverse
```

5.) Update the repository.

```
apt update && apt upgrade -y
```

6.) Now your done!



If there is a missing key error, just enter this comand:

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 871920D1991BC93C
```
