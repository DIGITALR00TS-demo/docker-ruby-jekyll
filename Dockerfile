FROM ruby:alpine

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

ADD Gemfile .

RUN set -ex && \
    \
    apk update && apk upgrade && \
    apk add --no-cache build-base && \
    \
    gem install --no-lock --no-post-install-message --file Gemfile && \
    \
    apk del build-base && \
    rm -rf -- /var/cache/apk/* /var/lib/apk/* /etc/apk/cache/* && \
    rm -rf -- Gemfile*
