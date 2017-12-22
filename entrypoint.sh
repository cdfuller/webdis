#!/bin/sh
set -e

echo "starting redis-server.." >&2
redis-server >/redis-server.log 2>&1 &

echo "taking a 3 second nap.." >&2
for i in 3 2 1; do echo -n "$i " >&2; sleep 1; done
echo

tail -F /webdis.log &
echo "starting webdis.." >&2
webdis /app/webdis.docker.json


exec "$@"
