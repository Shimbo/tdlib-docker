https://hub.docker.com/repository/docker/c1rcles/tdlib.alpine

```
docker pull c1rcles/tdlib.alpine
```


then you can extend your alpine Dockerfile with tdlib:
``` Dockerfile
...
COPY --from=c1rcles/tdlib.alpine /usr/local/lib /usr/local/lib
COPY --from=c1rcles/tdlib.alpine /usr/local/include /usr/local/include
...
```

Dont forget to install deps (openssl-dev, cmake, zlib-dev)
