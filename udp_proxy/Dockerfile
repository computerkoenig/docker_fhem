FROM nginx:stable
MAINTAINER Michael Schäfer

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl nginx-extras

RUN mkdir /log

COPY ./etc/nginx.conf /etc/nginx/nginx.conf

HEALTHCHECK --interval=20s --timeout=10s --start-period=30s --retries=3 CMD curl -fk http://localhost:81 || exit 1

VOLUME ["/etc/nginx/conf.d"]

EXPOSE 81
