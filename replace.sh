#!/bin/sh

instance=''

hosts=$(echo $ETCD | sed -e 's/,/ /g')

for x in $hosts
do
    instance=$instance'- url: "http://'$x'"\n'
done

echo $instance > /etc/dd-agent/conf.d/help.txt

sed 's/^/    /' /etc/dd-agent/conf.d/help.txt > /etc/dd-agent/conf.d/aux.txt

sed '/instances:/r /etc/dd-agent/conf.d/aux.txt' etcd.yaml > /etc/dd-agent/conf.d/etcd.yaml

/entrypoint.sh "$@"
