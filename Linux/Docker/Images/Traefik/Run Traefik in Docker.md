Filelocation:

docker-compose.yaml: /etc/traefik

traefik.yml: /etc/traefik

# docker-compose file

```yaml
version: '3'

services:
  traefik:
    image: "traefik:v2.5"
    container_name: "traefik"
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
      - "8080:8080"
    volumes:
      - /etc/traefik:/etc/traefik
      - /var/run/docker.sock:/var/run/docker.sock:ro
```

# traefik.yml file

```yaml
global:
  checkNewVersion: true
  sendAnonymousUsage: false  # true by default

# (Optional) Log information
# ---
# log:
#  level: ERROR  # DEBUG, INFO, WARNING, ERROR, CRITICAL
#   format: common  # common, json, logfmt
#   filePath: /var/log/traefik/traefik.log

# (Optional) Accesslog
# ---
# accesslog:
  # format: common  # common, json, logfmt
  # filePath: /var/log/traefik/access.log

# (Optional) Enable API and Dashboard
# ---
api:
 dashboard: true  # true by default
 insecure: true  # Don't do this in production!

# Entry Points configuration
# ---
entryPoints:
  web:
    address: :80
    http:
      redirections:
        entryPoint:
          to: websecure
          scheme: https

  websecure:
    address: :443
# Configure your CertificateResolver here...
# ---
certificatesResolvers:
#   staging:
#     acme:
#       email:
#       storage: /etc/traefik/certs/acme.json
#       caServer: "https://acme-staging-v02.api.letsencrypt.org/directory"
#       httpChallenge:
#         entryPoint: web
#
   production:
     acme:
       email: 
       storage: /etc/traefik/certs/acme.json
       caServer: "https://acme-v02.api.letsencrypt.org/directory"
       httpChallenge:
         entryPoint: web

# (Optional) Overwrite Default Certificates
# tls:
#   stores:
#     default:
#       defaultCertificate:
#         certFile: /etc/traefik/certs/cert.pem
#         keyFile: /etc/traefik/certs/cert-key.pem
# (Optional) Disable TLS version 1.0 and 1.1
#   options:
#     default:
#       minVersion: VersionTLS12

providers:
  docker:
    exposedByDefault: true # Default is true
  file:
    # watch for dynamic configuration changes
    directory: /etc/traefik/
    watch: true

```

# Container flags for easy exposing:

Example for nginx webserver:

```yaml
services:
  nginx:
    image: nginx:latest
    container_name: docker_onedns_ch
    restart: unless-stopped
    volumes:
     - /home/webserver/docker_onedns_ch:/usr/share/nginx/html
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.docker_onedns_ch.entrypoints=websecure"
      - "traefik.http.routers.docker_onedns_ch.rule=Host(`docker.onedns.ch`)"
      - "traefik.http.routers.docker_onedns_ch.tls=true"
      - "traefik.http.routers.docker_onedns_ch.tls.certresolver=production"
    networks:
      - traefik_default

networks:
  traefik_default:
    external: true
```

## Only needed labels:

```yaml
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.[servicename].entrypoints=websecure"
      - "traefik.http.routers.[servicename].rule=Host(`[Expose Domain]`)"
      - "traefik.http.routers.[servicename].tls=true"
      - "traefik.http.routers.[servicename].tls.certresolver=production"
    networks:
      - traefik_default

networks:
  traefik_default:
    external: true
```

# Reverse Proxy to external Server:

```yaml
#/etc/traefik/external/[rulename].yaml
http:
  routers:
    [rulename]:
      entryPoints:
        - "websecure"
      rule: "Host(`[Domain]`)"
      tls:
        certResolver: production
      service: [rulename]

  services:
    [rulename]:
      loadBalancer:
        servers:
          - url: "http://[ip-address]:[port]"
        passHostHeader: true
```
