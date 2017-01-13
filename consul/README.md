# Consul Nginx image

This image inherits from the ```bandsintown/nginx``` image adding support to manage the  Nginx configuration through [Consul](https://consul.io/)

It includes : 
  - [S6 Overlay](https://github.com/just-containers/s6-overlay) to properly manage multiple services in one container
  - [Consul template](https://github.com/hashicorp/consul-template) to manage dynamic configuration based on Consul


# Usage

### Consul Template

The following example mount the [Consul template](https://github.com/hashicorp/consul-template) configuration in the container: 

```
docker run --name nginx-consul -v etc/consul-template:/etc/consul-template:ro -d bandsintown/nginx:consul

```

or you can create your own ```Dockerfile```:

```
FROM bandsintown/nginx:consul

ADD etc/consul-template /etc/consul-template
```

# Load Balancing Sample

The [sample application](sample) demonstrate how to achieve load balancing with Nginx, [Consul](https://www.consul.io/) and [Registrator](http://progrium.com/blog/2014/09/10/automatic-docker-service-announcement-with-registrator/).

# Thanks

We would like to thanks [John Regan](https://github.com/jprjr) for his work on the [S6 system init](http://blog.tutum.co/2015/05/20/s6-made-easy-with-the-s6-overlay/) which is just awesome.
