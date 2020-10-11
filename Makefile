# Getting into running container
#   docker exec -it f835717dbd82 /bin/bash
#
# You can set these variables from the command line, and also from the environment
WEBAPPVERSION   ?= 0.0.2

.PHONY: all lint build push run

all: lint build push

lint:
		black -l 120 src/app/*

build:
		sed -i.back 's/__version__/${WEBAPPVERSION}/g' src/app/*
		docker build -t xdanny322/webapp:${WEBAPPVERSION} .
		sed -i.back 's/${WEBAPPVERSION}/__version__/g' src/app/*
		rm -f src/app/*.back

push:
		docker push xdanny322/webapp:${WEBAPPVERSION}

run_bash:
		docker run -it --rm  \
			--entrypoint /bin/bash \
			xdanny322/webapp:${WEBAPPVERSION}

run_app:
		docker run -it --rm  \
			xdanny322/webapp:${WEBAPPVERSION}

