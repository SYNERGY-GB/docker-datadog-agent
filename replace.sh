#!/bin/sh
sed -e "s/COUCHBASE-IP/${CB_HOST}/g" /couchbase.yaml > /etc/dd-agent/conf.d/couchbase.yaml

/entrypoint.sh "$@"