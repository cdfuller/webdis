FROM debian:stable-slim

RUN apt-get update
RUN apt-get -y --force-yes install wget make gcc libevent-dev
RUN apt-get -y --force-yes install redis-server

COPY . /app
WORKDIR /app
RUN make && make install
RUN apt-get remove -y wget make gcc

CMD /usr/local/bin/webdis webdis.docker.json

EXPOSE 7379
