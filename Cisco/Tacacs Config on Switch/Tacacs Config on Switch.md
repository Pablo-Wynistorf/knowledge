# Tacacs Config on Switch
```yaml
aaa group server tacacs+ ISE-Server
 server-private 10.1.0.15 key $KEY
 server-private 10.1.0.16 key $KEY
 ip tacacs source-interface vlan $VLAN
!
!
aaa authentication login default group ISE-Server local
aaa authentication enable default group ISE-Server enable
aaa authorization console 
aaa authorization config-commands
aaa authorization exec default group ISE-Server local 
aaa authorization commands 1 default group ISE-Server local
aaa authorization commands 15 default group ISE-Server local
!
do wr

```
