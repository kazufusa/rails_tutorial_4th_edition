FROM ruby:2.7.3

# Clean up
RUN apt-get autoremove -y \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get update \
    && apt-get -y install git nodejs sudo gosu \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

ENV SHELL /bin/bash

RUN useradd -m developer && echo "developer ALL=NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /usr/src/app

COPY Gemfile /usr/src/app
COPY Gemfile.lock /usr/src/app

RUN gem install bundler:2.2.19 solargraph -N

RUN yard config --gem-install-yri \
  && bundle install \
  && yard gems \
  && yarn
