FROM ruby:2.5.1
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install -y vim

# yarnのインストール
#RUN curl https://deb.nodesource.com/setup_12.x | bash
#RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
#RUN apt-get update && apt-get install -y nodejs yarn postgresql-client

WORKDIR /nursing-request

COPY Gemfile /nursing-request/Gemfile
COPY Gemfile.lock /nursing-request/Gemfile.lock

RUN bundle install
COPY . /nursing-request
RUN mkdir -p /tmp/sockets

VOLUME /app/public
VOLUME /app/tmp

# Start Server
# TODO: environment
CMD bundle exec puma