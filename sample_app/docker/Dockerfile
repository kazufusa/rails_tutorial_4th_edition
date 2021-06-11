# Ruby on Rails for production mode
FROM ruby:2.7.3 as rails

RUN apt-get autoremove -y \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get update \
    && apt-get -y install nodejs \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

ENV SHELL /bin/bash

RUN useradd -m developer && echo "developer ALL=NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock /usr/src/app/

RUN gem install bundler:2.2.19 -N \
  && bundle config set without development test \
  && bundle install

COPY ./ /usr/src/app

ARG RAILS_MASTER_KEY

ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY} \
    RAILS_ENV=production \
    RAILS_LOG_TO_STDOUT=true

RUN ./bin/rails assets:precompile

EXPOSE 3000

CMD ["bash", "-c", "./bin/rails db:setup && ./bin/rails s"]

# nginx
FROM nginx:latest as nginx
COPY --from=rails /usr/src/app/public /usr/share/nginx/public
COPY ./docker/nginx_server.conf /etc/nginx/conf.d/default.conf
