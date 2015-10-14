An example Docker container for Drupal projects, inheriting from [andrewholgate/drupal-php55-dev](https://hub.docker.com/r/andrewholgate/drupal-php55-dev/).

# Prerequisites

- Basic knowledge of [Docker](https://www.docker.com/)
- Knowledge of how to customise [docker-compose.yml](https://docs.docker.com/compose/yml/)

# Installation

## Database data container

```bash
# Build database image based off MySQL 5.5
sudo docker run -d --name drupal-example-mysql mysql:5.5 --entrypoint /bin/echo MySQL data-only container for Drupal project example
```

## Build Project using Docker Compose

```bash
# Clone Drupal development docker rep
git clone git@bitbucket.org:andrewholgate/docker-drupal-project-example.git
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

## Add IP to host

From the host server, add the web container IP address to the hosts file executing
the following script

```bash
./host.sh
```

# Logging Into Web Frontend

```bash
# Using the container name of the web frontend.
sudo docker exec -it dockerdrupalprojectexample_drupalexampleweb_1 su - ubuntu
```

# Configuration

## Project sources path

This example make the assumption that the sources of your Drupal project are installed under ` ~/develop/projects/drupal-example`. Consider to change this value when you copy the [docker-compose.yml.dist](https://github.com/andrewholgate/docker-drupal-project-example/blob/master/docker-compose.yml.dist#L9)
