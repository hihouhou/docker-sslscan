#
# Sslscan Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

#Update & install packages for installting curl
RUN apt-get update && \
    apt-get install -y build-essential git libssl-dev

#add repository
RUN git clone https://github.com/rbsec/sslscan.git
WORKDIR /sslscan

#install
RUN make && \
    make install
