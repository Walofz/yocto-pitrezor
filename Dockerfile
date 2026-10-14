FROM debian:buster

RUN sed -i 's|http://deb.debian.org/debian-security|http://archive.debian.org/debian-security|g; s|http://deb.debian.org/debian|http://archive.debian.org/debian|g; /buster-updates/d' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99archive && \
    apt-get update && \
    apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping locales lz4 zstd

RUN apt-get update && \
	apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping locales lz4 zstd

RUN git config --system url."https://".insteadOf git://
RUN useradd -ms /bin/bash -p build build --uid 30000

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV LANG en_US.utf8

USER build
WORKDIR /home/build
