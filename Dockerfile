FROM ruby:2.1.5

RUN apt-get update
WORKDIR /app
ADD Gemfile* /app/
RUN bundle install
ADD . /app
EXPOSE 4567

CMD ["middleman", "server"]
