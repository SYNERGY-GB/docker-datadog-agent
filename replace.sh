#!/bin/sh

instance=''

sed -e "s/COUCHBASE-IP/${CB_HOST}/g" couchbase.yaml > /etc/dd-agent/conf.d/couchbase.yaml

hosts=$(echo $ETCD | sed -e 's/,/ /g')

for x in $hosts
do
    instance=$instance'    - url: "https://'$x'"\n'
done

echo $instance > /etc/dd-agent/conf.d/help.txt

sed '/instances:/r /etc/dd-agent/conf.d/help.txt' etcd.yaml > /etc/dd-agent/conf.d/etcd.yaml

/entrypoint.sh "$@"