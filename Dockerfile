FROM python:3.6.0-alpine

ARG PGADMIN_DOWNLOAD_URL

RUN set -ex \
	&& apk add --no-cache --virtual .run-deps \
                nano \
		bash \
		postgresql-libs \
	&&  apk add --no-cache --virtual .build-deps \
                        openssl \
			gcc \
                        postgresql \
			postgresql-dev \
			musl-dev \
	&& apk add --no-cache \
		postgresql \
        && mkdir -p /home/app \
        && adduser -D -u 1000 -h /home/app -s /bin/false app \
        && chown -R app:app /home/app


USER app
RUN pip install -t /home/app ${PGADMIN_DOWNLOAD_URL}

USER root
COPY docker-entrypoint.sh /home/app/pgadmin4/
RUN chown -R app:app /home/app/pgadmin4/docker-entrypoint.sh 

USER app
WORKDIR /home/app/pgadmin4

EXPOSE 5050

ENTRYPOINT ["/home/app/pgadmin4/docker-entrypoint.sh", "pgadmin4"]
