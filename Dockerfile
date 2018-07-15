FROM php:7.2-alpine

MAINTAINER Bogardo

ENV PATH="${PATH}:/root/.composer/vendor/bin"
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN apk add --no-cache curl wget git zip unzip rsync bash \
    openssh openssh-client openssh-keygen openssh-keysign \
    && rm -rf /var/cache/apk/* \
    && curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer \
    && composer global require laravel/envoy --no-progress --no-suggest \
    && rm -rf /root/.composer/cache/*

CMD ["/bin/bash"]
