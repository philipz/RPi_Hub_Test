FROM philipz/rpi-raspbian:latest
MAINTAINER Philpz <philipzheng@gmail.com>

ENV QEMU_EXECVE 1
COPY qemu/cross-build-end qemu/cross-build-start qemu/qemu-arm-static qemu/sh-shim /usr/bin/
ADD HelloWorld.exe /
ADD run.sh /
RUN [ "cross-build-start" ]
RUN apt-get -qq update
RUN apt-get -y install wget 
RUN apt-get -y upgrade 
RUN wget http://sourceforge.net/projects/bananapi/files/mono_3.10-armhf.deb
RUN dpkg -i mono_3.10-armhf.deb
RUN rm mono_3.10-armhf.deb
RUN [ "cross-build-end" ]
ENTRYPOINT /run.sh
