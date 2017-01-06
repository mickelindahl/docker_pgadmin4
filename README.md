# Docker pgadmin4

Docker compose script for creating container runnning 
[pgAdmin 4](https://www.pgadmin.org/docs4/1.x/index.html)

## Installation

Run `mkdir -p data`

Run `cp sample.docker-compose.yml docker.compose.yml && docker-compose up -d`

Done!!

## Cnnnect to localhost

Run `sudo ip addr show docker0`

The IP adress shown is the one docker has given your computer (the host)
([source](http://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach)).

