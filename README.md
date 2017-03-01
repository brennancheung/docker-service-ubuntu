# docker-service-ubuntu
A Docker image for Ubuntu that stays alive when run as a service.

When working with Docker swarms and services I sometimes want a
normal Ubuntu container I can connect to and use to probe the other
services within a swarm.

When launching a service `docker service create ...` the normal
Ubuntu image will die instantly.  This prevents mean from doing
something like `docker exec -it CONTAINER_ID bash`.

This image will stay alive and has some basic utilities installed.

# Useful commands

Create the service:

`docker service create --name manager --network MY_PRIVATE_NETWORK volgenic/ubuntu-service`

Wait for the service to come up:

`docker service ls`

Connect to the running container:

```
MANAGER_ID=$(docker service ps -q manager)
CONTAINER_ID=$(docker inspect --format "{{.Status.ContainerStatus.ContainerID}}" $MANAGER_ID)
docker exec -it $CONTAINER_ID bash
```
