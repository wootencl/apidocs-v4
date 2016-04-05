FROM ubuntu:trusty

RUN apt-get -yq install software-properties-common
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -yq ruby2.2 ruby2.2-dev build-essential git zlib1g-dev liblzma-dev
RUN gem install --no-ri --no-rdoc bundler
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN cd /app; bundle install
ADD . /app
EXPOSE 4567
WORKDIR /app
CMD ["bundle", "exec", "middleman", "server"]
