FROM python:3.6.10-alpine

# environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# working dir
RUN mkdir /code
WORKDIR /code

# install psycopg2 dependencies
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add postgresql-dev \
    && pip install psycopg2 \
    && apk del build-deps

# install dependencies
RUN pip install --upgrade pip
COPY requirements.txt /code
RUN pip install -r requirements.txt

# copy project
COPY . /code

# collect static files
RUN python manage.py collectstatic --noinput

# add non-root user
RUN adduser -D app
USER app

# run gunicorn
CMD gunicorn fav_movies.wsgi:application --bind 0.0.0.0:$PORT

#ENTRYPOINT ["./entrypoint.sh"]
