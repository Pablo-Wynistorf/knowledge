```
#Plugin the Serial Cable.
#Press the Mode button
#Plugin the Powercable
#Hold the Modebutton until this shows up:
Using driver version 1 for media type 1
Base ethernet MAC Address: 50:1c:bf:f5:41:80
Xmodem file system is available.
The password-recovery mechanism is enabled.


#Release pressing the mode button
#A field with "switch:" should show up.
flash_init
delete flash:config.text
delete flash:vlan.dat
boot

```
