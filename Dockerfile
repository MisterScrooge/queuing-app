FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /queuing-app

WORKDIR /queuing-app

COPY Gemfile /queuing-app/Gemfile
COPY Gemfile.lock /queuing-app/Gemfile.lock

RUN bundle install

COPY . /queuing-app