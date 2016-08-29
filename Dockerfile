FROM alpine:3.4
MAINTAINER R.I.Pienaar <rip@devco.net>

RUN \
  echo 'gem: --no-rdoc --no-ri' >/etc/gemrc \
  && apk --update add \
  ca-certificates \
  ruby \
  ruby-bundler \
  && rm -rf /var/cache/apk/* \
  && mkdir -p /app

WORKDIR /app
EXPOSE 9292

ADD Gemfile* /app/
RUN bundle install

CMD /usr/bin/bundle exec ruby config.ru -p 9292 -o 0

ADD . /app/
