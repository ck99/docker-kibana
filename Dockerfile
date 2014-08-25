FROM ck99/java:0.0.2
MAINTAINER Ciaran Kelly <ciaran.kelly@gmail.com>

ENV KIBANA_VERSION 3.1.0

RUN apt-get update && apt-get install -yq --force-yes apache2

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN $HOME/docker-tools/unpack-remote-tarball-to \
    https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz \
    /kibana
