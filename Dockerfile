## BUILDER
FROM python:3.6.10-alpine as builder

# working dir
RUN mkdir /code
WORKDIR /code

# install dependencies
COPY requirements.txt /code
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /code/wheels -r requirements.txt


## FINAL
FROM python:3.6.10-alpine

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

# create directory for the app user
RUN mkdir -p /home/code

# create the app user
RUN addgroup -S app && adduser -S app -G app

# create the appropriate directories
ENV HOME=/home/code
ENV APP_HOME=/home/code/web
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# install dependencies
COPY --from=builder /code/wheels /code/wheels
COPY --from=builder /code/requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache /code/wheels/*

# copy project
COPY . $APP_HOME

# collect static files
RUN python manage.py collectstatic --noinput

# chown all the files to the app user
RUN chown -R app:app $APP_HOME

# change to the app user
USER app

# run gunicorn
CMD gunicorn fav_movies.wsgi:application --bind 0.0.0.0:$PORT
