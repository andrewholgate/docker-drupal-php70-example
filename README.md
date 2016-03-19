An example Docker container for Drupal projects using PHP7.0, HTTP/2; inheriting from [andrewholgate/drupal-php70-dev](https://hub.docker.com/r/andrewholgate/drupal-php70-dev/).

# Prerequisites

- Basic knowledge of [Docker](https://www.docker.com/)
- Knowledge of how to customise [docker-compose.yml](https://docs.docker.com/compose/yml/)

# Installation

## Database data container

```bash
# Build database image based off MySQL 5.7
sudo docker run -d --name drupal-php70-mysql mysql:5.7 --entrypoint /bin/echo MySQL data-only container for Drupal project PHP7.0
```

## Build Project using Docker Compose

```bash
# Clone Drupal development docker rep
git clone https://github.com/andrewholgate/docker-drupal-php70-example.git
cd docker-drupal-php70-example

# Customise docker-compose.yml file according to project requirements.
cp docker-compose.yml.dist docker-compose.yml
vim docker-compose.yml

# Customise Dockerfile according to project requirements.
vim Dockerfile

# Build docker containers using Docker Compose.
sudo docker-compose build --no-cache | tee ./build.log
sudo docker-compose up -d
```

## Add IP to host

From the host server, add the web container IP address to the hosts file executing
the following script

```bash
# Add the web container IP address to hosts file
./host.sh
```

# Logging into Web Frontend

```bash
# Using the container name of the web frontend.
sudo docker exec -it dockerdrupalphp70example_drupalphp70exampleweb_1 su - ubuntu
```

# Configuration

## Project directories and paths

This example assumes the project root is under ` ~/develop/projects/drupal-example`. It can be modified when copying [docker-compose.yml.dist](https://github.com/andrewholgate/docker-drupal-php70-example/blob/master/docker-compose.yml.dist#L9)

The [setup.sh](https://github.com/andrewholgate/docker-drupal-php70-example/blob/master/setup.sh) can be used to add symlinks to the project root for Apache, etc.
