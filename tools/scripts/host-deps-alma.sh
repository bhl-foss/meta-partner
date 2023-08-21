#!/bin/bash

sudo dnf install -y epel-release

sudo yum install dnf-plugins-core

sudo dnf config-manager --set-enabled crb

sudo dnf makecache

sudo dnf install \
    bzip2 \
    ccache \
    chrpath \
    cpio \
    cpp \
    diffstat \
    diffutils \
    gawk \
    gcc \
    gcc-c++ \
    git \
    glibc-devel \
    glibc-langpack-en \
    gzip \
    lz4 \
    make \
    mesa-libGL-devel \
    patch \
    perl \
    perl-Data-Dumper \
    perl-Text-ParseWords \
    perl-Thread-Queue \
    python3 \
    python3-GitPython \
    python3-jinja2 \
    python3-pexpect \
    python3-pip \
    rpcgen \
    SDL-devel \
    socat \
    tar \
    texinfo \
    unzip \
    wget \
    which \
    xz \
    zstd