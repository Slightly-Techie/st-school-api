ARG RUBY_VERSION=3.2.2-bullseye
FROM ruby:$RUBY_VERSION

RUN apt-get update -qq && \
  apt-get install -y build-essential libvips bash libffi-dev tzdata postgresql nodejs npm && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man

RUN gem install bundler:2.4.13
RUN gem install mailcatcher

WORKDIR /app

COPY docker/entrypoint.sh /app/docker/entrypoint.sh

ENV RAILS_LOG_TO_STDOUT="1" \
  RAILS_SERVE_STATIC_FILES="true" 
#   RAILS_ENV="production" \
#   BUNDLE_WITHOUT="development"

COPY Gemfile* ./
RUN bundle install

RUN bundle exec bootsnap precompile --gemfile app/ lib/

# ENTRYPOINT ["/app/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]