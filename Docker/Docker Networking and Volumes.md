### Networking
we are going to take a look at the basics of Docker networking and Docker volumes using the default drivers. Let's take a look at networking examples first.

Before we launch our application, let's download the container images we will be using, and also create the network:
```
docker image pull redis:alpine
docker image pull russmckendrick/moby-counter
docker network create moby-counter
```
Now that we have our images pulled and our network created, we can launch our containers, starting with the Redis one:
```
docker container run -d --name redis --network moby-counter redis:alpine
```
Now that the Redis container is launched, we can launch the application container by running the following command:
```
docker container run -d --name moby-counter --network moby-counter -p 8080:80 russmckendrick/moby-counter
```
All that remains now is to access the application. To do this, open your browser and go to http://localhost:8080/. You should be greeted by a mostly blank page, with the message Click to add logos…

Let's try using the exec command to ping the redis container from the moby-counter application and see what we get:
```
docker container exec moby-counter ping -c 3 redis
```
You may be thinking that the application's host file contains an entry for the redis container; let's take a look using the following command:
```
docker container exec moby-counter cat /etc/hosts
```
let's check /etc/resolv.conf by running the following command:
```
docker container exec moby-counter cat /etc/resolv.conf
```
Let's create a second network and launch another application container:
```
docker network create moby-counter2
docker run -itd --name moby-counter2 --network moby-counter2 -p 9090:80 russmckendrick/moby-counter
```
Now that we have the second application container up and running, let's try pinging the redis container from it:
```
docker container exec moby-counter2 ping -c 3 redis
#it gives you an error
```
Let's check the resolv.conf file to see whether the same nameserver is being used already, as follows:
```
docker container exec moby-counter2 cat /etc/resolv.conf
```

As we have launched the moby-counter2 container in a different network to that where the container named redis is running, we cannot resolve the hostname of the container:
```
docker container exec moby-counter2 nslookup redis 127.0.0.11
```
Let's look at launching a second Redis server in our second network.
```
docker container run -d --name redis2 --network moby-counter2 --network-alias redis redis:alpine
docker container exec moby-counter2 nslookup redis 127.0.0.1
```
You can find out more information about the configuration of the networks by running the following inspect command:
```
docker network inspect moby-counter
```
Before we progress to learn docker volumes, we should remove one of the applications and associated networks. To do this, run the following commands:
```
docker container stop moby-counter2 redis2
docker container prune
docker network prune
```

### Volumes
When you go to the application in a browser (at http://localhost:8080/), you will probably see that there already are Docker logos on screen. Let's stop and then remove the Redis container and see what happens. To do this, run the following commands:
```
docker container stop redis
docker container rm redis
```
If you have your browser open, you may notice that the Docker icons have faded into the background and there is an animated loader in the center of the screen. This is basically to show that the application is waiting for the connection to the Redis container to be re-established, Relaunch the Redis container using the following command:
```
docker container run -d --name redis --network moby-counter redis:alpine
```
Once you have a pattern, let's remove the Redis container again by running the following commands:
```
docker container stop redis
docker container rm redis
```
losing the data in the container is to be expected. However, as we used the official Redis image, we haven't, in fact, lost any of our data.
The Dockerfile for the official Redis image that we used available in dockerhub, lets review it: https://hub.docker.com/_/redis

If you notice, during the last part of the file, there are the VOLUME and WORKDIR directives declared; this means that when our container was launched, Docker actually created a volume and then run redis-server from within the volume. We can see this by running the following command:
```
docker volume ls
```

run the following command, making sure you replace the volume ID with that of your own:
```
docker container run -d --name redis -v 45c4cb295fc831c085c49963a01f8e0f79534b9 f0190af89321efec97b9d051f:/data -network moby-counter redis:alpine
```
You can view the contents of the volume by running the following command to attach the container and list the files in /data:
```
docker container exec redis ls -lhat /data
```

you can override the volume with your own. To create a volume, we need to use the volume command:
```
docker volume create redis_data
docker container run -d --name redis -v redis_data:/data --network moby-counter redis:alpine
```

Like the network command, we can view more information on the volume using the inspect command, as follows:
```
docker volume inspect redis_data
```