Isso Docker
===========

Build and embed your [isso](http://posativ.org/isso/) comments in a small container

You need make, [docker](http://docker.com), and
[docker-compose](https://docs.docker.com/compose/), and for mac user,
[boot2docker](http://boot2docker.io).

Build it
--------

    make

You can build the js files, too

    make js

Configure it
------------

in conf/isso.conf use something like that :

    [general]
    dbpath = /data/comments.db
    host = https://example.tld/
    [server]
    listen = http://localhost:1234/

Just read the [Isso's doc](http://posativ.org/isso/docs/configuration/server/)


Run it
------

    docker-compose up

license
-------

3 terms BSD licence © 2015 Mathieu Lecarme
