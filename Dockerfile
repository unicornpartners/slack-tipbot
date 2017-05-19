FROM ruby:2.3.1-alpine

ADD docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh && apk --no-cache add git g++ make && git clone https://github.com/mattgy/slack-tipbot.git && gem install bundler rake \
&& cd slack-tipbot && bundle install

ENTRYPOINT /docker-entrypoint.sh