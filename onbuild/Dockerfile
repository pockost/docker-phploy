FROM php:alpine

ENV COMPOSER_VERSION 1.6.3
ENV COMPOSER_SHA256 52cb7bbbaee720471e3b34c8ae6db53a38f0b759c06078a80080db739e4dcab6
ENV PHPLOY_VERSION 4.8.5
ENV PATH $PATH:/root/.composer/vendor/bin

ONBUILD RUN  apk add --no-cache git curl openssh-client \
  && curl https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar > /usr/local/bin/composer \
  && hash=$( sha256sum /usr/local/bin/composer | awk '{ print $1 }' ) \
  && test $hash == $COMPOSER_SHA256 || exit 1 \
  && chmod +x /usr/local/bin/composer \
  && /usr/local/bin/composer global require "banago/phploy:$PHPLOY_VERSION" \
  && rm -r /usr/local/bin/composer /root/.composer/cache \
  && apk del curl

WORKDIR /app
ENTRYPOINT [ "phploy" ]
