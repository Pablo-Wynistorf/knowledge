Docker-compose file:

```
version: '3.3'
services:
  database:
    image: mysql:latest
    container_name: [containername]
    restart: unless-stopped
    environment:
      MYSQL_DATABASE: 'db'   
      MYSQL_USER: '[username]
      MYSQL_PASSWORD: '[password]'      
      MYSQL_ROOT_PASSWORD: '[password]'
    ports:
      - '3306:3306'
    expose:
      - '3306'
    volumes:
      - './.mysql-data/db:/var/lib/mysql'
```

Enter MySQL Shell:

```
docker exec -it [containername] [containername] -u root -p
```
