FROM mysql:5.7

MAINTAINER merkl@proudsourcing.de

# timezone / date   
RUN echo "Europe/Berlin" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# install packages
RUN apt-get update && \
	apt-get install -y --force-yes less && \
	apt-get clean && \
	echo "export TERM=xterm" >> /root/.bashrc