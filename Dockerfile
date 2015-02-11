FROM philipz/rpi-raspbian
MAINTAINER Philpz <philipzheng@gmail.com>

ADD run.sh /
ENTRYPOINT /run.sh
