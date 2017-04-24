FROM ubuntu:latest
MAINTAINER TIM COWLISHAW "tim@timcowlishaw.co.uk"
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
EXPOSE 5000
