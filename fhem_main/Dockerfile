FROM fhem/fhem:latest
MAINTAINER Michael Schaefer

RUN apt-get update && apt-get -y upgrade \
&& apt-get -y install wget ca-certificates apt-transport-https sudo make curl ssh telnet git-core build-essential openssl libssl-dev

# NodeJS
RUN ARCH= && dpkgArch="$(dpkg --print-architecture)" \
  && case "${dpkgArch##*-}" in \
    amd64) ARCH='amd64';; \
    arm64) ARCH='arm64';; \
    armhf) ARCH='armv7l';; \
    *) echo "unsupported architecture"; exit 1 ;; \
  esac \
  && if [ "$ARCH" = "amd64" ]; then \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs ; fi \
  && if [ "$ARCH" = "arm64" ]; then \
    wget https://nodejs.org/dist/v12.12.0/node-v12.12.0-linux-arm64.tar.xz \
    && tar -xvf node-v12.12.0-linux-arm64.tar.xz \
    && cp -R node-v12.12.0-linux-arm64/* /usr/local/ ; fi \
  && if [ "$ARCH" = "armv7l" ]; then \
    wget https://nodejs.org/dist/v12.12.0/node-v12.12.0-linux-armv7l.tar.xz \
    && tar -xvf node-v12.12.0-linux-armv7l.tar.xz \
    && cp -R node-v12.12.0-linux-armv7l/* /usr/local/ ; fi

# Install perl packages
RUN apt-get -y install libalgorithm-merge-perl \
libclass-isa-perl \
libcommon-sense-perl \
libdpkg-perl \
liberror-perl \
libfile-copy-recursive-perl \
libfile-fcntllock-perl \
libio-socket-ip-perl \
libjson-perl \
libjson-xs-perl \
libmail-sendmail-perl \
libsocket-perl \
libswitch-perl \
libsys-hostname-long-perl \
libterm-readkey-perl \
libterm-readline-perl-perl \
libxml-simple-perl \
libwww-perl \
libdevice-serialport-perl \
libnet-telnet-perl \
libcrypt-rijndael-perl \
libdatetime-format-strptime-perl \
libio-socket-ssl-perl \
libsoap-lite-perl \
nodejs \
init \
python \
g++ \
libavahi-compat-libdnssd-dev

#Install other FHEM Tools
RUN apt-get -y install sendmail-bin etherwake python-pip && \
cpan install App::cpanminus && \
cpanm HTTP::Request && \
cpanm YAML && \
cpanm LWP::UserAgent && \
cpanm IO::Socket::SSL && \
cpanm JSON && \
cpanm Encode::Guess && \
cpanm Text::Iconv && \
cpanm HTML::Parse && \
cpanm Data::Dumper && \
cpanm MIME::Base64 && \
cpanm Module::Pluggable && \
cpanm Net::SIP
#cpanm WWW::Jawbone::Up

# Speedtest tool
RUN pip install speedtest-cli

## Install sipcmd - Telefonclient für die Fritzbox
#RUN apt-get -y install libopal-dev libpt-dev

#Alexa
RUN npm install -g alexa-fhem

RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

VOLUME ["/opt/fhem"]
EXPOSE 8083
