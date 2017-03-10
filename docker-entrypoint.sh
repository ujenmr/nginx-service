#!/bin/bash
if [ ! -z "$CONSUL" ]; then
    if [ "$1" = "test" ]; then
        consul-template -consul-addr=$CONSUL:8500 -template="/etc/nginx/nginx.conf.ctmpl:/etc/nginx/nginx.conf" --once
        nginx -t
    else
        consul-template -consul-addr=$CONSUL:8500 -template="/etc/nginx/nginx.conf.ctmpl:/etc/nginx/nginx.conf" --once
        nginx
        consul-template -consul-addr=$CONSUL:8500 -template="/etc/nginx/nginx.conf.ctmpl:/etc/nginx/nginx.conf:/bin/bash -c 'nginx -t && nginx -s reload || true'" || true
    fi
else
    nginx -g "daemon off;"
fi
