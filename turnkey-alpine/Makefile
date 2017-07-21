build:
	docker build --rm --tag ikaritw/einvturnkey-alpine:1.4.8 .

clean:
	docker rmi ikaritw/einvturnkey-alpine:1.4.8

bash:
	docker run -it --rm ikaritw/einvturnkey-alpine:1.4.8 /bin/bash

sh:
	docker run -it --rm ikaritw/einvturnkey-alpine:1.4.8 /bin/sh

kill:
	docker ps | grep "ikaritw/einvturnkey-alpine:1.4.8" | cut -d " " -f 1 | xargs -r docker kill

purge: kill clean

up:
	docker run -d --name einvturnkey_alpine_1.4.8 \
	-v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/VOLUMES/Workspace:/Workspace \
	-e DISPLAY=unix$DISPLAY \
	ikaritw/einvturnkey-alpine:1.4.8