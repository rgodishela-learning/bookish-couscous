Install docker compose on Linux
```
COMPOSEVERSION=1.25.4
curl -L https://github.com/docker/compose/releases/download/$COMPOSEVERSION/docker-compose-`uname -s`-`uname -m`
chmod +x /tmp/docker-compose
sudo mv /tmp/docker-compose /usr/local/bin/docker-compose
```
Test Docker compose version
```
docker-compose version
```
