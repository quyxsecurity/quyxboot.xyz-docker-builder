FROM ubuntu:26.04

LABEL org.opencontainers.image.description="Ubuntu-based Docker image for quyxboot.xyz tooling and bootstrapping workflows."
LABEL org.opencontainers.image.vendor="QuyxSecurity"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.url="https://github.com/quyxsecurity"
LABEL org.opencontainers.image.source="https://github.com/quyxsecurity/quyxbootxyz-docker-base"
LABEL org.opencontainers.image.documentation="https://github.com/quyxsecurity/quyxbootxyz-docker-base/blob/main/README.md"

ENV DEBIAN_FRONTEND=noninteractive

# renovate: datasource=pypi depName=ansible
ARG ANSIBLE_VERSION=14.4.0

ARG PYTHON_VERSION=3.14

RUN \
    apt-get update && \
    apt-get install -y \
        apache2 \
        binutils-dev \
        binutils-aarch64-linux-gnu \
        binutils-x86-64-linux-gnu \
        build-essential \
        dosfstools \
        figlet \
        gcc-aarch64-linux-gnu \
        gcc-x86-64-linux-gnu \
        genisoimage \
        git \
        isolinux \
        liblzma-dev \
        libslirp-dev \
        python3-pip \
        python3-setuptools \
        toilet

RUN rm -rf /usr/lib/python${PYTHON_VERSION}/EXTERNALLY-MANAGED

RUN pip3 install ansible==${ANSIBLE_VERSION}
