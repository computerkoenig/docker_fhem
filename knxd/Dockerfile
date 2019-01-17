FROM debian:latest
MAINTAINER Michael Schaefer

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade && \
apt-get -y --force-yes install \
debhelper \
cdbs \
automake \
libtool \
libusb-1.0-0-dev \
git-core \
build-essential \
libsystemd-dev \
dh-systemd \
libev-dev \
cmake \
pkg-config

#RUN git clone https://github.com/knxd/knxd.git && cd knxd && git checkout stable && dpkg-buildpackage -b -uc && cd .. && dpkg -i knxd_*.deb knxd-tools_*.deb

CMD ["/bin/bash"]
