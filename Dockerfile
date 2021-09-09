FROM ruby:alpine

RUN apk add --no-cache --update build-base postgresql-dev

WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock

RUN bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3
COPY . /usr/src/app

EXPOSE 3000

CMD ["puma", "-b", "tcp://0.0.0.0:3000"]
