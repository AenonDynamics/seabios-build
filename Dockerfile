FROM debian:buster

# system base packages + build dependencies + user setup ~350MB
RUN set -xe \
    && apt-get update \
    && apt-get install -y --no-install-recommends \ 
        nano bash ca-certificates openssh-client \
        g++ zlib1g-dev build-essential git \
        rsync libncurses5-dev gawk gettext unzip file libssl-dev wget time \
    && rm -rf /var/lib/apt/lists/* \
    && useradd build \
    && mkdir /opt/seabios \
    && mkdir /mnt/target \
    && chown build:build /opt/seabios

# run as build user
USER build

# checkout
ARG GIT_REVISION=1.13.0

# clone seabios repo
RUN set -xe \
    && cd /opt \
    && git clone --depth 1 https://git.seabios.org/seabios.git seabios

# checkout revision
RUN set -xe \
    && cd /opt/seabios \
    && git checkout rel-${GIT_REVISION}

# working dir
WORKDIR /opt/seabios

# start bash
ENTRYPOINT [ "/bin/bash" ]