# Favorite Movies Polls (django + docker + heroku + gunicorn)

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/lfbatista/movies_project/)

<h1>Quickstart</h1>
<p>These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.</p>

<h2>Prerequisites</h2>
<code>python==3.6 or up and django==2.7 or up</code>

<h2>Installing</h2>
<pre>Open the terminal and type:</pre>
<code>git clone https://github.com/lfbatista/movies_project.git</code><br>
<h5>or download this repository.</h5>

<h2>Migrate the database using the terminal in the project directory and type:</h2>
<code>python manage.py makemigrations</code><br>
<code>python manage.py migrate</code>

<h2>Create a superuser using this command:</h2>
<code>python manage.py createsuperuser</code>

<h2>Run the program in a local server using the following command:</h2>
<code>python manage.py runserver</code><br><br>

Browse [localhost:8000](http://localhost:8000) in your browser
