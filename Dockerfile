FROM nvidia/cuda:9.1-runtime-centos7

RUN yum -y install \
    libunwind \
    lttng-ust \
    libcurl \
    openssl-libs \
    libuuid \
    krb5-libs \
    libicu \
    zlib

ARG source
WORKDIR /app
COPY ${source} .