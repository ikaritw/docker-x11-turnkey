build:
	docker build --rm --tag ikaritw/einvturnkey:1.4.8 .

clean:
	docker rmi ikaritw/einvturnkey:1.4.8

bash:
	docker run -it --rm -p 8065:8065 ikaritw/einvturnkey:1.4.8 /bin/bash

sh:
	docker run -it --rm -p 8065:8065 ikaritw/einvturnkey:1.4.8 /bin/sh

kill:
	docker ps | grep "ikaritw/einvturnkey:1.4.8" | cut -d " " -f 1 | xargs -r docker kill

purge: kill clean