.PHONY: all lint build push run

all: lint build push run

lint:
		black -l 120 *

build:
		docker build -t xdanny322/webapp:latest .

push:
		docker push xdanny322/webapp:latest

run_bash:
		docker run -it --rm  \
			--entrypoint /bin/bash \
			xdanny322/webapp:latest

run_app:
		docker run -it --rm  \
			xdanny322/webapp:latest