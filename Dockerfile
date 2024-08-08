FROM ghcr.io/pterodactyl/yolks:alpine

MAINTAINER Jackson Holle, <github@jacksonholle.com>

RUN \
    apk add --no-cache --update curl bash coreutils shadow su-exec tzdata \
    && adduser --disabled-password --home /home/container container \
    && curl -sSL https://www.factorio.com/get-download/stable/headless/linux64 -o /home/container/factorio_headless_x64_stable.tar.xz
    && tar -xJf /home/container/factorio_headless_x64_stable.tar.xz

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]