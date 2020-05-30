# Favorite Movies Polls (django + gunicorn + nginx)
## Production
### With Heroku (w/out nginx)</h3>
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/lfbatista/movies_project/)
### With Docker</h3>
- Update the environment variables.
- Build the images and run the containers:

    ```sh
    $ docker-compose -f docker-compose.prod.yml up -d --build
    ```
Browse [localhost](http://localhost)

## Development
### Quickstart
<p>These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.</p>

#### Using Docker

- Update the environment variables in the *docker-compose.yml* and *.env.dev* files.
- Build the images and run the containers:

    ```sh
    $ docker-compose up -d --build
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
