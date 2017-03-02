# Nginx-Service

## Docker Hub
[nginx-service](https://hub.docker.com/r/ujenmr/nginx-service/)

## Technologies
 * nginx
 * consul-template
 * consul
 * springboot
 * consul-registration

## Description
Nginx-service generates the config (nginx.conf) when any of SpringBoot application server appears in the Consul

For registration you can also use [consul-registrator](https://github.com/gliderlabs/registrator) for this case you need to add your Dockerfile the follow lines:

```
...
ENV SERVICE_TAGS "contextPath=/dashboard"
ENV SERVICE_NAME "dashboard"
ENV SERVICE_CHECK_TCP "true"
ENV SERVICE_CHECK_INTERVAL "15s"
...
```

## Usage
```bash
docker run --name nginx-service -d -p 8080:80 -e CONSUL=172.17.0.1 ujenmr/nginx-service
```

## Test
```
docker run --name nginx-service -d -p 8080:80 -e CONSUL=172.17.0.1 ujenmr/nginx-service test
```
