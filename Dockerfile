FROM centurylink/ruby-base:2.1.5

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates curl libcurl4-openssl-dev git

# Install Node
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

# Clean up apt
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Update npm
RUN npm install -g npm@latest

# Get bower
RUN npm install -g bower

# Install ember-cli
RUN npm install -g ember-cli

WORKDIR /tmp
ADD package.json package.json
ADD bower.json bower.json
RUN npm install
RUN bower install --allow-root

RUN mkdir -p /opt/app
RUN cp -a /tmp/node_modules /opt/app/
RUN cp -a /tmp/bower_components /opt/app/

ADD . /opt/app

WORKDIR /opt/app

CMD ["ember", "server", "--watcher=polling"]
