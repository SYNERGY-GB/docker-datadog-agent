#!/bin/sh

hosts=$ETCD
instance=''

sed -e "s/COUCHBASE-IP/${CB_HOST}/g" couchbase.yaml > /etc/dd-agent/conf.d/couchbase.yaml

for x in $hosts
do
    instance=$instance'\t- url: "https://'$x'"\n'
done

echo $instance > help.txt

sed '/instances:/r help.txt' etcd.yaml > /etc/dd-agent/conf.d/etcd.yaml

/entrypoint.sh "$@"