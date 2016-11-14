#FROM newsdev/varnish:4.1.0
FROM debian:8

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install -qq \
    curl \
    libedit2 \
    libjemalloc1 \
    build-essential \
&& apt-get autoremove -y \
&& rm -rf /var/lib/apt/lists/*

ENV VARNISH_VERSION 5.0.0

RUN curl -J -L -s -k \
    "https://repo.varnish-cache.org/pkg/${VARNISH_VERSION}/varnish_${VARNISH_VERSION}-1_amd64.deb" \
    -o /tmp/varnish.deb \
&& dpkg -i /tmp/varnish.deb \
&& rm /tmp/varnish.deb

COPY start-varnishd.sh /usr/local/bin/start-varnishd
RUN chmod +x /usr/local/bin/start-varnishd

ENV VARNISH_PORT 80
ENV VARNISH_STORAGE malloc,100m

EXPOSE 80

CMD ["start-varnishd"]

ONBUILD COPY default.vcl /etc/varnish/default.vcl