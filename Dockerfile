FROM python:latest
ENV LANG C.UTF-8

MAINTAINER Valériane Venance "valeriane.venance@clever-cloud.com"

RUN mkdir /app

RUN apt-get -y update
RUN apt-get install -y python python-pip python-dev python-psycopg2 

ADD requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

RUN apt-get -y update && apt-get -y autoremove
WORKDIR /app

COPY . /app/

EXPOSE 8000
ENV CUSTOM_SECRET_KEY Z66Qv%xNY2WzMHYo?K#RwrvtucIjvCYMECKe4nsk1CwI2Ithyu
ENV PRODUCTION True

CMD gunicorn -b :8000 project.wsgi