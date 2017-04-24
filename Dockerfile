FROM ubuntu:latest
MAINTAINER TIM COWLISHAW "tim@timcowlishaw.co.uk"
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN pip install --upgrade pip
ENV FLASK_APP=radioserver
ENV FLASK_DEBUG=true
COPY . /app
WORKDIR /app
RUN pip install -e . 
ENTRYPOINT ["./run.sh"]
EXPOSE 5000
