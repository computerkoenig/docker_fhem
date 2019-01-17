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
curl

# NodeJS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get -y install nodejs 

COPY ./etc/alexa-fhem.tgz /opt/alexa-fhem.tgz

RUN cd /opt/ && tar -xzf alexa-fhem.tgz && mv package alexa-fhem && cd alexa-fhem && npm i npm@latest -g && npm install && mkdir /root/.alexa

COPY ./etc/startup.sh /opt/alexa-fhem/startup.sh

EXPOSE 3000
CMD ["/opt/alexa-fhem/startup.sh"]
