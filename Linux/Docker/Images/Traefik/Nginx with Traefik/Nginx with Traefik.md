# docker-compose file:

```yaml
services:
  nginx:
    image: nginx:latest
    container_name: [containername]
    restart: unless-stopped
    volumes:
     - /home/webserver/[datastore]:/usr/share/nginx/html
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.[Servicename].entrypoints=[Service Entrypoint]"
      - "traefik.http.routers.[Servicename].rule=Host(`[Publish Domain]`)"
      - "traefik.http.routers.[Servicename].tls=true"
      - "traefik.http.routers.[Servicename].tls.certresolver=[Certresolver]"
    networks:
      - traefik_default

networks:
  traefik_default:
    external: true
```
