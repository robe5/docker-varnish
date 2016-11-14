#!/bin/bash
exec varnishd -j unix,user=varnish -F \
              -f /etc/varnish/default.vcl
              -s ${VARNISH_STORAGE} \
              -a 0.0.0.0:${VARNISH_PORT} \
              -p http_req_hdr_len=16384 \
              -p http_resp_hdr_len=16384 ${VARNISH_DAEMON_OPTS}