FROM python:3.6.10-alpine

# working dir
RUN mkdir /code
WORKDIR /code

# environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# install psycopg2 dependencies
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add postgresql-dev \
    && pip install psycopg2 \
    && pip install --no-cache-dir black \
    && apk del build-deps

# install dependencies
RUN pip install --upgrade pip
COPY requirements.txt /code
RUN pip install -r requirements.txt

# run gunicorn
#CMD gunicorn fav_movies.wsgi:application --bind 0.0.0.0:$PORT

# copy entrypoint.sh
COPY entrypoint.sh /code/entrypoint.sh

# copy project
COPY . /code

# run entrypoint
ENTRYPOINT ["/code/entrypoint.sh"]
