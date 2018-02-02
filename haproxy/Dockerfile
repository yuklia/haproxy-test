FROM ubuntu:trusty
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV TERM=linux

RUN apt-get update && apt-get upgrade -y && apt-get install software-properties-common python3-software-properties python-software-properties wget -y
RUN add-apt-repository ppa:vbernat/haproxy-1.5 && apt-get update && apt-get install supervisor haproxy make -y --force-yes

ENV CONFD_VERSION="0.14.0" \
    CONFD_URL="https://github.com/kelseyhightower/confd/releases/download"

RUN set -x \
  && apt-get update && apt-get install -y --no-install-recommends && rm -rf /var/lib/apt/lists/* \
  && wget --no-check-certificate --retry-connrefused -t 5 ${CONFD_URL}/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -O /bin/confd \
  && chmod +x /bin/confd \
  && apt-get purge -y --auto-remove wget

COPY confd /etc/confd
COPY confd/supervisor/ /etc/supervisor/conf.d
#COPY ssl /etc/haproxy/ssl
COPY docker-entrypoint.sh /entrypoint.sh

EXPOSE 80 443 8000

CMD ["/usr/bin/supervisord"]
