# docker-compose file:

```yaml
version: '3.1'
volumes:
  nextcloud:
  db:
services:

  db:
    image: mysql
    restart: unless-stopped
    ports:
      - 3306:3306
    environment:
      - MYSQL_ROOT_PASSWORD=[password]
      - MYSQL_PASSWORD=[password]
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
    networks:
      - traefik_default
  app:
    image: nextcloud:latest
    restart: unless-stopped
    ports:
      - [port]:80
    links:
      - db
    volumes:
      - nextcloud:/var/www/html
    environment:
      - MYSQL_PASSWORD=[password]
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_HOST=db
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.[Servicename].entrypoints=websecure"
      - "traefik.http.routers.[Servicename].rule=Host(`[Publish Domain]`)"
      - "traefik.http.routers.[Servicename].tls=true"
      - "traefik.http.routers.[Servicename].tls.certresolver=production"
    networks:
      - traefik_default

networks:
  traefik_default:
    external: true
```
