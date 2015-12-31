FROM elbaschid/python:2.7
MAINTAINER Sebastian Vetter <seb@roadsi.de>

# `dbus` needs to be installed here because firefox requires it to be setup.
# Otherwise, running the browser will fail.
RUN apk update -q && apk add --no-cache xvfb firefox dbus

ADD https://gist.github.com/elbaschid/5a91271c07bb0de7bfa6/raw/d07b4eecf02fd3341ef72753e4c5875cf137bda8/xvfb-run.sh /usr/bin/xvfb-run
RUN chmod u+x /usr/bin/xvfb-run

ENTRYPOINT ["xvfb-run"]
