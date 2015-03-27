.phony: build

build: ./app/bin/isso
	docker build -t isso .

./app/bin/isso: ./app/bin/python
	docker run --volume=`pwd`/app:/app -ti --rm --workdir=/app python:2-wheezy /app/bin/pip install isso

./app/bin/python: app
	docker run --volume=`pwd`/app:/app -ti --rm --workdir=/app python:2-wheezy virtualenv .

app:
	mkdir app

src:
	mkdir src

src/README.md: src
	git clone https://github.com/posativ/isso.git src/

js: src/README.md
	docker run --volume=`pwd`/src:/src --rm --workdir=/src node:wheezy sh -c 'npm install -g requirejs uglify-js jade bower && make init && make js'
	echo "Your minified javascript files are here:"
	find src/isso/js -name *.min.js
