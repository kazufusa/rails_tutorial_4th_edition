# Ruby on Rails for production mode
FROM ruby:2.7.3 as rails

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

COPY Gemfile Gemfile.lock /usr/src/app/

RUN gem install bundler:2.2.19 -N \
  && bundle config set without development test \
  && bundle install

COPY ./ /usr/src/app

ENV RAILS_ENV=production \
  RAILS_LOG_TO_STDOUT=true

EXPOSE 3000

CMD ["bash", "-c", "export SECRET_KEY_BASE=`./bin/rake secret` && ./bin/rails s -b 0.0.0.0"]

# nginx
FROM nginx:latest as nginx
COPY --from=rails /usr/src/app/public /usr/share/nginx/html
# COPY ./docker/nginx.conf /etc/nginx/nginx.conf
