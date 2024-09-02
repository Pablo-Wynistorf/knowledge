First you need a Dockerfile:

```bash
FROM nginx:latest

WORKDIR /usr/share/nginx/html

COPY index.html .

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

When youre done with the first step, go the the directory containing the Dockerfile.

```
docker build -t myimage .
```

After building the image, it should be listed when you type in:

```
docker images
```

# Push the image to Dockerhub:

1. Log in to Docker Hub: Run the "docker login" command to log in to Docker Hub using your Docker ID and password.

```
docker login
```

1. Tag the image: Use the "docker tag" command to tag the image with a name that includes your Docker ID. This is the name that will be used on Docker Hub.

```
docker tag myimage <dockerid>/myimage
```

1. Push the image: Use the "docker push" command to push the image to Docker Hub.

```
docker push <dockerid>/myimage
```

1. Verify the image: Log in to Docker Hub and verify that the image was successfully published. You can now use the image by pulling it from Docker Hub.
