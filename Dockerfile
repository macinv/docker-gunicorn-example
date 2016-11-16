FROM python:2.7-alpine
MAINTAINER Jeff Li <jeff.li@mackenzieinvestments.com>

# Add Tini
ENV TINI_VERSION v0.13.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

COPY . /app
WORKDIR /app

RUN pip install -r requirement.txt

EXPOSE 8080

ENTRYPOINT ["/tini", "--"]
CMD ["gunicorn", "-w 3", "-b :8080", "main:app"]
