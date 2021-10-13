#!/usr/bin/env sh
set -eu

echo 'Creating .htpasswd file...'
(apt-get update && apt-get install -y apache2-utils && apt-get clean) > /dev/null
htpasswd -cb /etc/nginx/conf.d/nginx.htpasswd "$HTTP_BASIC_USER" "$HTTP_BASIC_PASS"
envsubst '${NGINX_HOST} ${BACKEND_PORT} ${PROXY_REALM}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"