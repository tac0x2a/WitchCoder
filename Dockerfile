
# Base Settings
FROM ruby:2.4.1-alpine3.4
MAINTAINER TAC tac0x2a

# Update
RUN apk update && apk add --update alpine-sdk sqlite sqlite-dev nodejs tzdata

# Install docker
# RUN apk update && apk add docker=1.11.2-r1 --no-cache

# Application Volumes
RUN mkdir -p /witchcoder
ENV HOME /witchcoder
WORKDIR /witchcoder
VOLUME /witchcoder

ADD Gemfile /witchcoder/Gemfile
ADD Gemfile.lock /witchcoder/Gemfile.lock
RUN bundle install
ADD . /witchcoder

# Run Application
ENTRYPOINT rails s
