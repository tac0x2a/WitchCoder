
# Base Settings
FROM ruby:2.4.1-alpine3.4
MAINTAINER TAC tac0x2a

# Update
RUN apk update && apk add --update alpine-sdk

# Application Volumes
RUN mkdir -p /witchcoder-judge
ENV HOME /witchcoder-judge
WORKDIR /witchcoder-judge
VOLUME /witchcoder-judge

ADD Gemfile /witchcoder-judge/Gemfile
RUN bundle install

ADD run.rb /witchcoder-judge/run.rb

# ADD . /witchcoder-judge
