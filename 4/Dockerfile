FROM php:alpine

ENV COMPOSER_VERSION 1.6.3
ENV COMPOSER_SHA256 52cb7bbbaee720471e3b34c8ae6db53a38f0b759c06078a80080db739e4dcab6
ENV PHPLOY_VERSION 4.8

ADD https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar /usr/local/bin/composer

RUN hash=$( sha256sum /usr/local/bin/composer | awk '{ print $1 }' ) \
    && test $hash == $COMPOSER_SHA256 || exit 1 \
    && chmod +x /usr/local/bin/composer \
    && /usr/local/bin/composer global require "banago/phploy:4.7" \
    && mv /root/.composer/vendor/banago/phploy/dist/phploy.phar /usr/local/bin/phploy \
    && rm -r /root/.composer \
    && rm /usr/local/bin/composer \
    && chmod +x /usr/local/bin/phploy

WORKDIR /app
ENTRYPOINT [ "phploy" ]
