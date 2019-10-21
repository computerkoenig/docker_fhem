FROM debian:stable
MAINTAINER Michael Schaefer

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade && \
apt-get -y install \
build-essential \
libssl-dev \
python \
g++ \
libavahi-compat-libdnssd-dev \
curl \
ssh \
netcat

# NodeJS
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get -y install nodejs

RUN npm install -g alexa-fhem

RUN mkdir /root/.alexa && mkdir /opt/alexa

COPY ./etc/startup.sh /opt/alexa/startup.sh

HEALTHCHECK --interval=10s --timeout=10s --start-period=30s --retries=3 CMD nc -z 127.0.0.1 3000 || exit 1

EXPOSE 3000
# CMD ["/bin/bash"]
# CMD ["/usr/bin/alexa-fhem"]
CMD ["/opt/alexa/startup.sh"]
