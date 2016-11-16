# docker-gunicorn-example
[![](https://images.microbadger.com/badges/image/macinv/gunicorn-example.svg)](https://microbadger.com/images/macinv/gunicorn-example "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/macinv/gunicorn-example.svg)](https://microbadger.com/images/macinv/gunicorn-example "Get your own version badge on microbadger.com")

[![Build Status](https://travis-ci.org/macinv/docker-gunicorn-example.svg?branch=master)](https://travis-ci.org/macinv/docker-gunicorn-example)

Using gunicorn to serve flack in a Docker container

To run (at port `8080`):

    docker run -p 8080:8080 macinv/gunicorn-example
