In the frist session, we launched the most basic container of all, the hello-world container, using the following command
```
docker container run hello-world
```
As you may recall, this command pulls a 13.3 KB image from the Docker Hub. You can find the Docker Hub page for the image at https://hub.docker.com/images/hello-world/, and, as per the following Dockerfile, it runs an executable called hello
```
FROM scratch
COPY hello /
CMD ["/hello"]
```
As the process exits, our container also stops. This can be seen by running the following command:
```
docker container ls -a
```
We can remove the container with a status of exited by running the following command, making sure that you replace the name of the container with your container_name
```
docker container rm <container_name>
```
also end of the first session, we launched a container using the official NGINX image by using the following command:
```
docker container run -d --name nginx-test -p 8080:80 nginx
```
As you can see, running the Docker image ls shows us that we now have two images downloaded and also running. The following command shows us that we have a running container
```
docker container ls
```
As you can see from our docker container run command, we introduced three flags. One of them was -d, which is shorthand for --detach. If we hadn't added this flag, then our container would have executed in the foreground, which means that our Terminal would have been frozen until we passed the process an escape command by pressing Ctrl + C. We can see this in action by running the following command to launch a second NGINX container to run alongside the container we have already launched:
```
docker container run --name nginx-foreground -p 9090:80 nginx
```
The first way of interacting with your running container is to attach to the running process. We still have our nginx-test container running, so let's connect to that by running this command:
```
docker container attach nginx-test
```
Opening your browser and going to http://localhost:8080/ will print the NGINX access logs to the screen, just like when we launched the nginx-foreground container. Pressing Ctrl + C will terminate the process and return your Terminal to normal. However, as before, we would have terminated the process that was keeping the container running. We can start our container back up by running the following command
```
docker container start nginx-test
```
This will start the container back up in the detached state, meaning that it is running in the background again, as this was the state that the container was originally launched in. Going to http://localhost:8080/ will show you the NGINX welcome page again.

Let's reattach to our process, but this time with an additional option:
```
docker container attach --sig-proxy=false nginx-test
```
Hitting the container's URL a few times and then pressing Ctrl + C will detach us from the NGINX process, but this time, rather than terminating the NGINX process, it will just return us to our Terminal, leaving the container in a detached state that can be seen by running 
```
docker container ls
```
This is a great way of quickly attaching to a running container to debug issues while keeping the container's main process up and running.
### EXEC
The attach command is useful if you need to connect to the process your container is running, if you need something that is a little more interactive then we have to use exec command. this creates a second process within the container that you can interact with, For example, to see the contents of the /etc/debian_version file, we can run the following command:
```
docker container exec nginx-test cat /etc/debian_version
```
We can take this one step further by running the following command
```
docker container exec -i -t nginx-test /bin/bash
```
### logs
The logs command is pretty self-explanatory. It allows you to interact with the stdout stream of your containers, which Docker is keeping track of in the background. For example, to view the last entries written to stdout for our nginx-test container, you just need to use the following command:
```
docker container logs --tail 5 nginx-test
```
To view the logs in real time, I simply need to run the following:
```
docker container logs -f nginx-test
```
I can also, for example, view everything that has been logged since a certain time by running the following command:
```
docker container logs --since 2020-11-28T15:52:00 nginx-test
docker container logs --since 2020-11-28T15:52:00 -t nginx-test
```
### top
The top command is quite a simple one; it lists the processes running within the container that you specify, and is used as follows:
```
docker container top nginx-test
```
### stats
The stats command provides real-time information on either the specified container or, if you don't pass a NAME or ID container, on all running containers:
```
# Viewing the real-time stats of a single container
docker container stats nginx-test
```
```
# Viewing the real-time stats of all running containers
docker container stats -a
```
### Resource limits
Viewing the real-time stats of all running containers. We can put limits on the resources our containers can consume. 
```
docker container run -d --name nginx-test --cpu-shares 512 --memory 128M -p 8080:80 nginx
```
However, we didn't launch our nginx-test container with any resource limits, meaning that we need to update our already running container. To do this, we can use the update command. Now, you may have thought that this should just entail running the following command:
```
docker container update --cpu-shares 512 --memory 128M nginx-test
```
### Pause and Unpause
Listing all of the containers, including those that have exited
```
docker container ls -a 
```
Before we continue, let's launch five more containers. To do this quickly, run the following command:
```
# Launching five containers quickly
for i in {1..5}; do docker container run -d --name nginx$(printf "$i") nginx; done
```
Let's look at pausing nginx1. To do this, simply run the following:
```
docker container pause nginx1
```
you can resume a paused container using the unpause command, as follows:
```
docker container unpause nginx1
```
### STOP,START, RESTART and KILL
Next up, we have the stop, start, restart, and kill commands. We have already used the start command to resume a container with a status of Exited. The stop command works exactly the same way as when we used Ctrl + C to detach from your container running in the foreground.
```
docker container stop nginx2
docker container stop -t 60 nginx3
```
The start command, as we have already seen, will start the process back up; however, unlike the pause and unpause commands, the process, in this case, starts from scratch using the flags that originally launched it, rather than starting from where it left off:
```
docker container start nginx2 nginx3
```
The restart command is a combination of the following two commands; it stops and then starts the ID or NAME container you pass it. Also, as with stop, you can pass the -t flag:
```
docker container restart -t 60 nginx4
```
Finally, you also have the option of sending a SIGKILL command immediately to the container by running the kill command:
```
docker container kill nginx5
```
To remove the two exited containers, I can simply run the prune command:
```
docker container prune
```
You can choose which container you want to remove using the rm command
```
docker container rm nginx4
```
Another alternative would be to string the stop and rm commands together:
```
docker container stop nginx3 && docker container rm nginx3
```


