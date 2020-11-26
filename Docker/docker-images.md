#Clone the example git repo
git clone https://github.com/dockersamples/node-bulletin-board
cd node-bulletin-board/bulletin-board-app

##### build the image
docker build --tag bulletinboard:1.0 .

##### run your image as a container
docker run --publish 8000:8080 --detach --name bb bulletinboard:1.0

##### delete the container
docker rm --force bb

##### Share your image on Docker Hub
docker tag bulletinboard:1.0 <Your Docker ID>/bulletinboard:1.0

##### Push your image to Docker Hub
docker push <Your Docker ID>/bulletinboard:1.0

