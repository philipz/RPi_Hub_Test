FROM philipz/rpi-raspbian:latest
MAINTAINER Philpz <philipzheng@gmail.com>

RUN apt-get -qq update
RUN apt-get -y install wget 
RUN apt-get -y upgrade 
RUN wget http://sourceforge.net/projects/bananapi/files/mono_3.10-armhf.deb
RUN dpkg -i mono_3.10-armhf.deb
RUN rm mono_3.10-armhf.deb
ADD HelloWorld.exe /
ADD run.sh /
ENTRYPOINT /run.sh
