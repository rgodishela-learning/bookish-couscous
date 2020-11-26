##### Install docker on Linux
```
curl -sSL https://get.docker.com/ | sh
sudo systemctl start docker
```
#### add your current user to the Docker group
```
sudo usermod -aG docker username
```
##### Test Docker version
```
docker --version
```
##### Test Docker installation
```
docker run hello-world
```
##### Check the docker image which downloaded
```
docker image ls
```
##### Check the docker image which downloaded
```
docker ps --all
```

##### Get the docker help
```
docker help
```
#### further help with a particular command
```
docker <command> --help
```
##### let's run the hello-world container
```
docker container run hello-world
```
##### let's download and run an NGINX container by running the following two commands
```
docker image pull nginx
docker container run -d --name nginx-test -p 8080:80 nginx
```
##### Stop the container
```
docker container stop nginx-test
```
##### Remove the container
```
docker container rm nginx-test
```
[Install Docker Engine in Linux](https://docs.docker.com/engine/install/)