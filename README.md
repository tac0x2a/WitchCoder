# WitchCoder [![Build Status](https://travis-ci.org/tac0x2a/WitchCoder.svg?branch=master)](https://travis-ci.org/tac0x2a/WitchCoder)

![](./doc/img/logo.png)

WitchCoder is online judge platform.

# How to RUN
## Native
```sh
# for Mac OS X
$ brew install postgresql
$ bundle install
$ rails db:create db:migrate db:seed
$ rails s
```

## Docker
```sh
# build judge-server container
$ cd judge_server
$ docker-compose build

$ cd ..
$ docker-compose build
$ docker-compose run web bin/rails db:create db:migrate db:seed
$ docker-compose up -d
```

Then, access `http://localhost:3000` .
