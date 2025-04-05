# Dockerfile

FROM ruby:3.2.0

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN yarn install

RUN bundle exec rails assets:precompile

EXPOSE 3000

CMD ["bin/dev"]
