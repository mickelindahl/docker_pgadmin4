FROM python:3-alpine

ARG PGADMIN_DOWNLOAD_URL=https://ftp.postgresql.org/pub/pgadmin3/pgadmin4/v1.1/pip/pgadmin4-1.1-py3-none-any.whl

RUN set -x \
	&&  apk add --no-cache postgresql-libs \
	&&  apk add --no-cache --virtual .build-deps \
			gcc \
			postgresql-dev \
			musl-dev \
      &&  pip install ${PGADMIN_DOWNLOAD_URL}
