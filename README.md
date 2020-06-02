# Favorite Movies Polls (django + gunicorn + nginx)
## Production
### With Heroku</h3>
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/lfbatista/movies_project/)
### With Docker</h3>
[![Docker cloud build](https://img.shields.io/docker/cloud/build/batistaluisfilipe/movies_web)](https://hub.docker.com/r/batistaluisfilipe/movies_web)
[![Docker automated build](https://img.shields.io/docker/cloud/automated/batistaluisfilipe/movies_web)](https://hub.docker.com/r/batistaluisfilipe/movies_web)
[![Docker image version](https://images.microbadger.com/badges/version/batistaluisfilipe/movies_web.svg)](https://hub.docker.com/r/batistaluisfilipe/movies_web)
[![Docker image size](https://img.shields.io/docker/image-size/batistaluisfilipe/movies_web)](https://hub.docker.com/r/batistaluisfilipe/movies_web)
[![Docker layers](https://img.shields.io/microbadger/layers/batistaluisfilipe/movies_web)](https://hub.docker.com/r/batistaluisfilipe/movies_web)
<!-- [![](https://images.microbadger.com/badges/image/batistaluisfilipe/movies_web.svg)](https://hub.docker.com/r/batistaluisfilipe/movies_web) -->

- Rename *.env.prod.example* to *.env.prod*
- Update the environment variables in the *docker-compose.yml* and *.env.dev* files
- Build the images and run the containers:

    ```sh
    $ docker-compose -f docker-compose.prod.yml up -d
    ```
Browse [localhost](http://localhost)

## Development
### Quickstart
<p>These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.</p>

#### Using Docker

- Rename *.env.dev.example* to *.env.dev*
- Update the environment variables in the *docker-compose.yml* and *.env.dev* files
- Build the images and run the containers:

    ```sh
    $ docker-compose up -d
    ```
Browse [localhost:8000](http://localhost:8000)

#### Manual Installation
#### Prerequisites
> python==3.6 or up and django==2.7 or up

In the terminal, type:
```sh
$ git clone https://github.com/lfbatista/movies_project.git
```
or [download](https://github.com/lfbatista/movies_project/archive/docker.zip) this repository.

#### Migrate the database

```sh
$ python manage.py makemigrations
$ python manage.py migrate
```

#### Create a superuser

```sh
$ python manage.py createsuperuser
``` 
#### Run the program in a local server

```sh
$ python manage.py runserver
```
Browse [localhost:8000](http://localhost:8000)

## Licensing [![license](https://img.shields.io/github/license/lfbatista/movies_project)](LICENSE)

This program is free software: you can redistribute it and/or modify it
under the terms of the [MIT license](LICENSE).
