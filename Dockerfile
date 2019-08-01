FROM ruby:2.4.5

RUN apt-get update -qq
RUN apt-get install -y build-essential
RUN apt-get install -y libpq-dev
RUN apt-get install -y nodejs
RUN apt-get install -y vim
RUN apt-get install -y sudo
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
      && apt-get install -y nodejs

#作業ﾃﾞｨﾚｸﾄﾘ作成
RUN mkdir /myapp
WORKDIR /myapp

#gemfile追加
ADD Gemfile /myapp/Gemfile
RUN sudo gem uninstall bundler
RUN sudo rm /usr/local/bin/bundle
RUN sudo gem install bundler

#gemfile install
RUN bundle
ADD . /myapp

