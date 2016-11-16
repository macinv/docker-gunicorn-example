FROM python:2.7-alpine
MAINTAINER Jeff Li <jeff.li@mackenzieinvestments.com>

# add tini
RUN apk add --update tini

COPY . /app
WORKDIR /app

RUN pip install -r requirement.txt

EXPOSE 8080

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["gunicorn -w 3 -b :8080 main:app"]
