# Pritunl with MongoDB Docker Container


## How to use this container

I would recommend creating two container volumes to save the Pritunl config and MongoDB files.

Example:

```
$ docker volume create pritunl-mongodata
$ docker volume create pritunl-pritunldata
```

Then run the container.

Example:
```
$ docker run -d --privileged --hostname <insert_hostname> --restart=unless-stopped -p 1194:1194/udp -p 1194:1194/tcp -p 443:443/tcp -p 80:80/tcp -p <external_port>:<external_port> -v pritunl-mongodata:/data/db -v pritunl-pritunldata:/var/lib/pritunl --name pritunl jknsware/docker-pritunl
```

Once done, wait a few seconds and open `https://localhost` in your browser.

From there, follow the setup instructions found at [Pritunl](https://docs.pritunl.com/docs).

The container has to be run with `--privileged` otherwise the OpenVPN server won't start. I've yet to find a reason why that is required. _This can be a [security concern](https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities)_.

## How to build this container

Basic instructions on how to build this container yourself.

Example:

```
$ git clone git@github.com:jknsware/docker-pritunl.git
$ cd docker-pritunl
$ docker build . --tag <insert_your_tag_here>
$ docker run -d --privileged --hostname <insert_hostname> --restart=unless-stopped -p 1194:1194/udp -p 1194:1194/tcp -p 443:443/tcp -p 80:80/tcp -p <external_port>:<external_port> -v pritunl-mongodata:/data/db -v pritunl-pritunldata:/var/lib/pritunl --name pritunl jknsware/docker-pritunl
```


### Thanks

- [@pritunl](https://pritunl.com), for creating a great, open source product.
- [@jippi](https://hub.docker.com/r/jippi/pritunl/), for providing a great jumping off point.
- [@michelkaeser](https://hub.docker.com/r/michelkaeser/docker-pritunl/), for providing a great example for me to work off of.
- [@codep0tato](https://github.com/codep0tato), for introducing me to Pritunl.
