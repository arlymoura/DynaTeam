# Dockerfile

FROM ruby:3.2.0

RUN apt-get update -qq && apt-get install -y \
  curl \
  gnupg2 \
  build-essential \
  libpq-dev \
  postgresql-client \
  git


RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn


WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN yarn install

RUN bundle exec rails assets:precompile

EXPOSE 3000

CMD ["bin/dev"]
