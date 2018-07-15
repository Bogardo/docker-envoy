FROM php:7.2-alpine

Maintainer Bogardo

RUN apk add --no-cache curl git zip unzip rsync \
    && rm -rf /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV PATH="${PATH}:/root/.composer/vendor/bin"
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer global require laravel/envoy
