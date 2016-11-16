FROM python:2.7-alpine
MAINTAINER Jeff Li <jeff.li@mackenzieinvestments.com>

ENV TINI_VERSION v0.13.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /tini.asc
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
 && gpg --verify /tini.asc

COPY . /app
WORKDIR /app

RUN pip install -r requirement.txt

EXPOSE 8080

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["gunicorn -w 3 -b :8080 main:app"]
