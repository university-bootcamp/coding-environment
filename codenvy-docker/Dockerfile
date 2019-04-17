FROM ruby:2.5

USER root

RUN gem install rails --version "5.2.1"
RUN gem install pg

EXPOSE 3000

RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update -qq

# install pg and other necessary packages for codenvy
RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends postgresql postgresql-contrib postgresql-client sudo bash build-essential libpq-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add node.js ppa for node 8 & install node
RUN sudo apt-get update -qq \
  && sudo apt-get install -y --no-install-recommends curl software-properties-common \
  && curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \
  && sudo apt-get install -y --no-install-recommends nodejs

# setup db
RUN /etc/init.d/postgresql start && sudo -u postgres sh -c 'createuser root & createdb root' && sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password 'password';"

RUN sudo service postgresql start

EXPOSE 5432

CMD tail -f /dev/null
