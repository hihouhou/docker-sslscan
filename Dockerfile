#
# Sslscan Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV SSLSCAN_VERSION 1.11.10-rbsec

#Update & install packages for installting curl
RUN apt-get update && \
    apt-get install -y build-essential wget libssl-dev git zlib1g-dev

#Fetch repository
RUN mkdir sslscan && \
    cd sslscan && \
    wget https://api.github.com/repos/rbsec/sslscan/tarball/${SSLSCAN_VERSION} -O ${SSLSCAN_VERSION}.tar.gz && \
    tar xf  ${SSLSCAN_VERSION}.tar.gz --strip-components=1 && \
    make static

WORKDIR /sslscan

CMD ./sslscan $options $url
