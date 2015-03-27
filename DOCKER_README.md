### Installing Requirements for OS X ( you probably have some of this stuff if you are reading this)

Install [Homebrew](http://brew.sh/):

```shell
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install git:

```shell
brew install git
```

Install [Docker Machine](https://github.com/docker/machine):

```shell
curl -L https://github.com/docker/machine/releases/download/v0.1.0/docker-machine_darwin-amd64 > /usr/local/bin/docker-machine
chmod +x /usr/local/bin/docker-machine
```

Install Virtualbox:

```shell
brew install brew-cask
brew cask install virtualbox
```

Install [Docker Compose](https://github.com/docker/compose):

```shell
curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

### Setup

Set up your local VM with Docker Machine:

```shell
docker-machine create --driver virtualbox ember-cli-todos
```

Configure Docker Machine when you open a new shell (replace .zshrc with your specifics):

```shell
echo '$(docker-machine env ember-cli-todos)' >> ~/.zshrc
```

Checkout the ember-cli-todos project:

```shell
cd ~/my_projects
git clone ember-cli/ember-cli-todos
cd ember-cli-todos
```

Build the images:

```shell
docker-compose build
```

Run the bootstrap tasks for each repo:

### Running the services

Start everything:

```shell
docker-compose up -d
```

Check status of the services:

```shell
docker-compose ps
```

Follow the logs
```shell
docker-compose logs
```

Get the IP for your VM

```shell
docker-machine ip ember-cli-todos
```

You can now visit the app in your browser at http://{ip-from-previos-command}:4200

Changes you make in `app/`, `config/`, `public/`, or `test/` will be automatically updated in the container.  

Other changes will require a rebuild:

```shell
docker-compose stop todos
docker-compose build todos
docker-compose up -d
```
