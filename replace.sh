#!/bin/sh

instance=''

sed -e "s/COUCHBASE-IP/${CB_HOST}/g" couchbase.yaml > /Users/marysalcedo/couchbase.yaml

hosts=$(echo $ETCD | sed -e 's/,/ /g')

for x in $hosts
do
    instance=$instance'\t- url: "https://'$x'"\n'
done

echo $instance > help.txt

sed '/instances:/r help.txt' etcd.yaml > /Users/marysalcedo/etcd.yaml

