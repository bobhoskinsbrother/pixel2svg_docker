FROM ubuntu:latest

MAINTAINER Ben Hoskins

RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN pip install --upgrade pip
RUN pip install svgwrite
RUN pip install pillow

RUN mkdir -p /opt/pixel2svg/
COPY ./libs/pixel2svg-0.3.0 /opt/pixel2svg
WORKDIR /opt/pixel2svg

CMD python setup.py install

ENTRYPOINT ["python", "pixel2svg.py"]

