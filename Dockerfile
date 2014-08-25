FROM ck99/java:0.0.2
MAINTAINER Ciaran Kelly <ciaran.kelly@gmail.com>

ENV KIBANA_VERSION 3.1.0

RUN apt-get update && apt-get install -yq --force-yes apache2
RUN a2enmod proxy_http

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN $HOME/docker-tools/unpack-remote-tarball-to \
    https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz \
    /kibana
RUN rm -rf /var/www/html && ln -s /kibana /var/www/html

ADD config/kibana/config.js /kibana/config.js
ADD config/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN mkdir /etc/service/apache
ADD config/apache/service.sh /etc/service/apache/run
RUN chmod 755 /etc/service/apache/run
# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
EXPOSE 80
