FROM debian:jessie-backports

MAINTAINER https://github.com/gnilchee

RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 09617FD37CC06B54 \
	&& echo "deb http://dist.crystal-lang.org/apt crystal main" > /etc/apt/sources.list.d/crystal.list \
	&& apt-get update && apt-get install -y crystal gcc libssl-dev libevent-dev libpcre++-dev libgc-dev \
	&& rm -rf /var/lib/apt/lists/*

CMD crystal play -b 0.0.0.0 -p 8080
