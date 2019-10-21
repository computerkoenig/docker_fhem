FROM debian:latest
MAINTAINER Michael Schäfer

RUN apt-get update && apt-get upgrade -y \
&& apt-get install -y build-essential libssl-dev curl

# Install NodeJS
RUN apt-get install -y curl software-properties-common && \
curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

RUN apt-get install -y python g++ libavahi-compat-libdnssd-dev

RUN npm install -g --unsafe-perm homebridge
RUN npm install -g homebridge-fhem

COPY ./etc/startup.sh /startup.sh

VOLUME ["~/.homebridge"]

HEALTHCHECK --interval=10s --timeout=10s --start-period=30s --retries=3 CMD curl -sS 127.0.0.1:51826 || exit 1
EXPOSE 51826
CMD ["/startup.sh"]
