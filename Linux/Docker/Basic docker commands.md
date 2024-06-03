```bash
docker –version 
#This command is used to get the currently installed version of docker 
docker pull <image name> 
#This command is used to pull images from the docker repository 
Usage: docker run -it -d <image name>
#This command is used to create a container from an image 
docker ps 
#This command is used to list the running containers 
docker ps -a 
#This command is used to show all the running and exited containers 
docker exec -it <container id> bash 
#This command is used to access the running container 
docker stop <container id> 
#This command stops a running container 
docker login 
#This command is used to login to the docker hub repository 
docker push <username/image name> 
#This command is used to push an image to the docker hub repository 
docker images 
#This command lists all the locally stored docker images 
docker rm <container id> 
#This command is used to delete a stopped container 
docker rm $(docker ps -q)
#This command is used to delete all containers
docker rmi <image-id> 
#This command is used to delete an image from local storage 
docker build <path to docker file> 
#This command is used to build an image from a specified docker file 
docker-compose -f <file-location-composefile> up / -d 
#This command is used to compose a docker-compose file 
docker rename 
#This command is used to rename a Container 
docker restart 
#This command is used to restart a contaner 
docker restart $(docker ps -q) 
#This command is used to restart all active containers 
docker cp 
#This command is used to Copy files/folders between a container and the local filesystem 
Docker ps --all 
#This command is used to show all Containers 

docker rm -f $(docker ps -q)
#This command is used to delete all Containers.

docker rm -f $(docker ps -f name=test -q)
#This command is used to delete all Containers which contain "test" in their name
```
