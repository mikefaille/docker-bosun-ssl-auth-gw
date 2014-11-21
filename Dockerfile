FROM nginx
MAINTAINER MarvAmBass

RUN apt-get update && apt-get install -y \
    openssl

RUN rm -rf /etc/nginx/conf.d/*
RUN mkdir -p /etc/nginx/external

ADD basic.conf /etc/nginx/conf.d/basic.conf
ADD security.conf /etc/nginx/conf.d/security.conf

ADD entrypoint.sh /opt/entrypoint.sh
RUN chmod a+x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["nginx"]
