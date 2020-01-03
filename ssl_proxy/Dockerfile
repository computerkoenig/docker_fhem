FROM nginx:stable
MAINTAINER Michael Schäfer

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl nginx-extras

RUN mkdir -p /etc/ssl/nginx \
&& mkdir /log

HEALTHCHECK --interval=20s --timeout=10s --start-period=30s --retries=3 CMD curl -fk https://localhost:444 || exit 1

VOLUME ["/etc/nginx/conf.d"]
VOLUME ["/certfiles"]

EXPOSE 80
EXPOSE 443
