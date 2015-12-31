FROM alpine:3.3
MAINTAINER Sebastian Vetter <seb@roadsi.de>

RUN apk update -q && apk add --no-cache bash wget python3

RUN wget "https://bootstrap.pypa.io/get-pip.py" --no-check-certificate -O /dev/stdout | python3
