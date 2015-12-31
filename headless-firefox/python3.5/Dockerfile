FROM elbaschid/python:3.5
MAINTAINER Sebastian Vetter <seb@roadsi.de>

RUN apk update -q && apk add --no-cache xvfb firefox dbus

ADD requirements.txt /project/requirements.txt

RUN wget "https://bootstrap.pypa.io/get-pip.py" --no-check-certificate -O /dev/stdout | python3 && \
    pip install -r /project/requirements.txt

ADD https://gist.github.com/elbaschid/5a91271c07bb0de7bfa6/raw/d07b4eecf02fd3341ef72753e4c5875cf137bda8/xvfb-run.sh /usr/bin/xvfb-run
RUN chmod u+x /usr/bin/xvfb-run

ADD . /project
WORKDIR /project

VOLUME /var/splinter

ENTRYPOINT ["xvfb-run", "python3"]
CMD ["check_tracking_number.py"]
