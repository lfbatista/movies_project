# Favorite Movies Polls (django + gunicorn + nginx)
## Production
### With Heroku (w/out nginx)</h3>
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/lfbatista/movies_project/)
### With Docker</h3>
- Update the environment variables.
- Build the images and run the containers:

    ```sh
    docker-compose -f docker-compose.prod.yml up -d --build
    ```
Browse [localhost](http://localhost)

## Development
### Quickstart
<p>These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.</p>
#### Using Docker 
- Update the environment variables in the *docker-compose.yml* and *.env.dev* files.
- Build the images and run the containers:

    ```sh
    docker-compose up -d --build
    ```
Browse [localhost:8000](http://localhost:8000)

#### Manual Installation 
#### Prerequisites 
<code>python==3.6 or up and django==2.7 or up</code>

<pre>Open the terminal and type:</pre>
<code>git clone https://github.com/lfbatista/movies_project.git</code><br>
##### or download this repository.

#### Migrate the database using the terminal in the project directory and type: 
<code>python manage.py makemigrations</code><br>
<code>python manage.py migrate</code>

#### Create a superuser using this command: 
<code>python manage.py createsuperuser</code>

#### Run the program in a local server using the following command: 
<code>python manage.py runserver</code>

Browse [localhost:8000](http://localhost:8000)
