FROM ruby:3.2.1
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev

ENV APP_PATH /myapp

RUN mkdir $APP_PATH
WORKDIR $APP_PATH

ADD Gemfile $APP_PATH/Gemfile
ADD Gemfile.lock $APP_PATH/Gemfile.lock
RUN bundle install

ADD . $APP_PATH
