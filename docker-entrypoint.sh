#!/usr/bin/env sh
set -eu

envsubst '${NGINX_HOST} ${BACKEND_PORT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"