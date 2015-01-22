FROM datadog/docker-dd-agent
MAINTAINER Mariana Salcedo <mariana.salcedo@synergy-gb.com>

#Add and extract application
ADD  couchbase.yaml /scripts
ADD  replace.sh /bin/replace.sh

ENTRYPOINT ["/replace.sh"]