# Docker pgadmin4

Docker compose script for creating container runnning 
[pgAdmin 4](https://www.pgadmin.org/docs4/1.x/index.html)

## Installation

Run `cp sample.config_local.py config_local.py`. 

Add DEFAULT_SERVER and mail settings in `config_local.py`.

Run `cp sample.docker-compose.yml docker.compose.yml` and open `docker-compose.yml` and set a username and password`

Run `docker-compose build && docker-compose up -d`

Done!!

## Cnnnect to localhost

Run `sudo ip addr show docker0`

The IP adress shown is the one docker has given your computer (the host)
([source](http://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach)).

## Drop connections 
If you can not delete a database because there are existing connectins you can use the following
code to drop all connections except your own. 
```sql
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE datname = current_database()
  AND pid <> pg_backend_pid();
```
Also restart postgres `sudo service postgresql restart`
