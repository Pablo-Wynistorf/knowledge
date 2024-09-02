1.) Create systemd service:

```bash
nano /etc/systemd/system/server01.service
```

2.) Set the service settings:

```bash
[Service]
ExecStart=/app/service-binary
WorkingDirectory=/app
Environment="VAR_NAME=value" "ANOTHER_VAR=another_value"
[Install]
WantedBy=multi-user.target
```

After changes use:

```bash
systemctl daemon-reload
```

3.) Enable the service:

```bash
systemctl enable --now server01.service
```

Monitor the service with:

```bash
systemctl status server01
journalctl -u server01
```
