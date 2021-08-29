FROM ruby:2.5.1

RUN  apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /usr/src/app
RUN mkdir -p /tmp/cache

ADD Gemfile /tmp/cache/Gemfile
ADD Gemfile.lock /tmp/cache/Gemfile.lock
RUN /bin/bash -l -c "cd /tmp/cache && bundle install --jobs 20 --retry 5 --without test development"

WORKDIR /usr/src/app

COPY . /usr/src/app

EXPOSE 3000

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["bundle exec rails db:create db:migrate && bundle exec rails server"]
