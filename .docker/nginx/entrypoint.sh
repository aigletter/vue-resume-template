#!/bin/sh

echo "APP_ENV=$APP_ENV" >> /dev/stdout

if [ "$APP_ENV" = "dev" ]; then
    cp /tmp/dev.conf /etc/nginx/conf.d/default.conf
else
    cp /tmp/prod.conf /etc/nginx/conf.d/default.conf
fi

exec /docker-entrypoint.sh nginx -g "daemon off;"