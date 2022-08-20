# Garbage collector for Docker Swarm

## About 

Image for automatic removing unused Docker Swarm objects. Also works just as Docker Service.

By default these types of objects are deleted:
- networks
- containers
- dangling images

## Configuration

Set config parameters in the yml file:
* AGE - the max time for resource to be unused (format: timestamp or Go duration strings (10m, 1h30m))
* SLEEP - the time frame between checking for unused objects (format: timestamp or Go duration strings (10m, 1h30m))
* STICKY_LABEL - do not remove image with this label

### Building image with `STICKY_LABEL`

If you need to protect an image from automatic deletion use LABEL directive, for example: `permanent=true`. To do it just create Dockerfile for you image <IMAGENAME>.

```yaml
FROM <IMAGENAME>
LABEL permanent=true
```

Before run the stack build the image from Dockerfile mentioned above:

docker-compose.yaml
```yaml
...
  <SERVICENAME>
    container_name: <CONTAINERNAME>
    build:
      context: .
...

```
* `<IMAGENAME>` - the image which is protected from automatic deletion
* `<SERVICENAME>` - service name in the stack
* `<CONTAINERNAME>` - container name (optionally)

Also you should set `STICKY_LABEL: permanent=true` in the docker_gc run variables

## Run

* docker-stack.yml - to deploy the service in Docker Swarm
* docker-compose.yml - to run just a Docker Service
