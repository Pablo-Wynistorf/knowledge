# Installation:

```bash
sudo apt update
```

```bash
apt install bind9 -y
```

Edit Configfile:

```bash
sudo nano /etc/bind/named.conf.local
```

Add these lines:

```bash
zone "[DOMAIN]" {
    type master;
    file "/etc/bind/zones/[DOMAIN].db";
};
```

Create the Zone dir:

```bash
sudo mkdir /etc/bind/zones
```

Create the Zone file:

```bash
sudo nano /etc/bind/zones/[DOMAIN].db
```

```bash
$TTL 86400
@       IN      SOA     ns1.[DOMAIN]. admin.[DOMAIN]. (
                        2023080301      ; Serial
                        3600            ; Refresh
                        1800            ; Retry
                        604800          ; Expire
                        86400           ; Minimum TTL
                        )
; Define the nameservers and the localhost
@       IN      NS      ns1.[DOMAIN].
@       IN      NS      ns2.[DOMAIN].
@       IN      A       [ROOT DOMAIN IP]
[SUBDO] IN      A       [RESOLVE IP]
[SUBDO] IN      CNAME   [REOLVE CNAME].

; Define additional hostnames
ns1     IN      A       127.0.0.1
ns2     IN      A       127.0.0.1
```

Check the configuration:

```bash
sudo named-checkconf
sudo named-checkzone [DOMAIN] /etc/bind/zones/[DOMAIN].db
```

If no error, restart bind:

```bash
sudo service bind9 restart
```

Now your good to go. But if you want to use the dns resolution localy on the machine, change these lines in /etc/reolv.conf or in netplan.

```bash
sudo nano /etc/resolv.conf
nameserver 127.0.0.1
```

Testing:

```bash
ping [DOMAIN]
```







Working configfiles:

```bash
named.conf.local
sudo nano /etc/bind/named.conf.local
```

```bash
//
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";

zone "pablo.local" {
    type master;
    file "/etc/bind/zones/pablo.local.db";
};
```





```bash
pablo.local.db
sudo nano /etc/bind/zones/pablo.local.db
```

```bash
$TTL 86400
@       IN      SOA     ns1.pablo.local. admin.pablo.local. (
                        2023080301      ; Serial
                        3600            ; Refresh
                        1800            ; Retry
                        604800          ; Expire
                        86400           ; Minimum TTL
                        )
; Define the nameservers and the localhost
@       IN      NS      ns1.pablo.local.
@       IN      NS      ns2.pablo.local.
@       IN      A       1.1.1.1
test    IN      A       10.1.3.10
google  IN      CNAME   google.com.
; Define additional hostnames
ns1     IN      A       127.0.0.1
ns2     IN      A       127.0.0.1
```
