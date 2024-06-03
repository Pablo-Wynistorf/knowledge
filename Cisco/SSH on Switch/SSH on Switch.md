# Switch Configuration:

```
conf t
!
ip default-gateway 10.197.0.1
!
interface vlan 1
ip address 10.197.0.20 255.255.255.0
!
hostname switch
ip domain-name onedns.ch
!
crypto key generate rsa
!
2048
!
line vty 0 4
!
transport input ssh
!
login local
!
password Pablo123
!
line console 0
!
logging synchronous
!
login local
!
conf t
!
username pablo password Pablo123
!
enable secret Pablo123
!
service password-encryption
!

```
