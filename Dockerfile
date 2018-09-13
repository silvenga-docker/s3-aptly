FROM ubuntu:bionic

LABEL matainer="Mark Lopez <m@silvenga.com>"

RUN set -xe \
    && DEBIAN_FRONTEND=noninteractive apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y gnupg1 \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ED75B5A4483DA07C \
    && echo "deb http://repo.aptly.info/ squeeze main" >> /etc/apt/sources.list \
    && DEBIAN_FRONTEND=noninteractive apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    aptly=1.3.0 \
    && rm -r /var/lib/apt/lists/*

RUN set -xe \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" >> /etc/apt/sources.list \
    && DEBIAN_FRONTEND=noninteractive apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs npm s3cmd mono-runtime \
    && npm install marked -g \
    && rm -r /var/lib/apt/lists/*