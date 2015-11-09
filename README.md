An example Docker container for Drupal projects, inheriting from [andrewholgate/drupal-php55-dev](https://hub.docker.com/r/andrewholgate/drupal-php55-dev/).

# Prerequisites

- Basic knowledge of [Docker](https://www.docker.com/)
- Knowledge of how to customise [docker-compose.yml](https://docs.docker.com/compose/yml/)

# Installation

## Database Data Container

```bash
# Build database image based off MySQL 5.6
sudo docker run -d --name drupal-example-mysql mysql:5.6 --entrypoint /bin/echo MySQL data-only container for Drupal project example
```

## Build Project using Docker Compose

```bash
# Clone Drupal development docker rep
git clone git@github.com:andrewholgate/docker-drupal-project-example.git
cd docker-drupal-project-example

# Customise docker-compose.yml file according to project requirements.
cp docker-compose.yml.dist docker-compose.yml
vim docker-compose.yml

# Customise Dockerfile according to project requirements.
vim Dockerfile

# Build docker containers using Docker Compose.
sudo docker-compose build | tee ./build.log
sudo docker-compose up -d
```

## Add IP to Host

From the host server, add the web container IP address to the hosts file executing
the following script

```bash
./host.sh
```

# Logging into Web Frontend

```bash
# Using the container name of the web frontend.
sudo docker exec -it dockerdrupalprojectexample_drupalexampleweb_1 su - ubuntu
```

# Configuration

## Project Assumptions

The default configuration assumes that the project is installed under [`~/develop/projects/drupal-example`](https://github.com/andrewholgate/docker-drupal-project-example/blob/master/docker-compose.yml.dist#L9)

By default, the project root should contain the sub-directory `repo/docroot` with `docroot` being served as the [document root](https://github.com/andrewholgate/docker-drupal-project-example/blob/master/setup.sh#L5-L6) by Apache.
