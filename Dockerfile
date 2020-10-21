FROM ruby:2.5.1
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /myproject

COPY Gemfile /myproject/Gemfile
COPY Gemfile.lock /myproject/Gemfile.lock

RUN bundle install
RUN mkdir app/tmp/pids
RUN mkdir app/tmp/sockets
COPY . /myproject