.phony: build

build: ./app/bin/isso
	docker build -t isso .

./app/bin/isso: ./app/bin/python
	docker run --volume=`pwd`/app:/app -ti --rm --workdir=/app python:2-wheezy /app/bin/pip install isso

./app/bin/python: app
	docker run --volume=`pwd`/app:/app -ti --rm --workdir=/app python:2-wheezy virtualenv .

app:
	mkdir app
