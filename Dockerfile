FROM ruby:3.2.0-alpine

ENV INSTALL_PATH /opt/app

RUN apk add --no-cache build-base libpq-dev tzdata

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

COPY . $INSTALL_PATH

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 9999

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "9999"]
