# Varnish

## Supported tags and respective `Dockerfile` links

- [`5.0.0`, `5.0`, `5`, `latest` (*5.0.0/Dockerfile*)](https://github.com/robe5/docker-varnish/blob/5/Dockerfile)

## What is Varnish?

[Varnish Cache](https://www.varnish-cache.org/) is a web application accelerator also known as a caching HTTP reverse proxy. You install it in front of any server that speaks HTTP and configure it to cache the contents. Varnish Cache is really, really fast. It typically speeds up delivery with a factor of 300 - 1000x, depending on your architecture.

> [wikipedia.org/wiki/Varnish_(software)](https://en.wikipedia.org/wiki/Varnish_(software))

## How to use this image.

This image is intended as a base image for other images to built on.

### Create a `Dockerfile` in your Varnish project

```dockerfile
FROM robe5/varnish:5.0.0
```

### Create a `default.vcl` in your Varnish project

```vcl
vcl 4.0;

backend default {
    .host = "www.nytimes.com";
    .port = "80";
}
```

Then, run the commands to build and run the Docker image:

```console
$ docker build -t my-varnish .
$ docker run -it --rm --name my-running-varnish my-varnish
```

### Customize configuration

You can override the port Varnish serves in your Dockerfile.

```dockerfile
FROM robe5/varnish:5.0.0

ENV VARNISH_PORT 8080

ENV VARNISH_DAEMON_OPTS "options here"
EXPOSE 8080
```

For valid VARNISH_DAEMON_OPTS, see the [varnish options documentation](https://www.varnish-cache.org/docs/5.0/reference/varnishd.html#options).



You can override the type and size of the cache.

```dockerfile
FROM robe5/varnish:5.0.0

ENV VARNISH_STORAGE malloc,100m
```


# License

View [license information](https://www.apache.org/licenses/LICENSE-2.0) for the software contained in this image.

## Disclaimer

This is image is based in [newsdev/docker-varnish](https://github.com/newsdev/docker-varnish)

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/docker-library/php/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.