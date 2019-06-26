FROM postgres:11
MAINTAINER <m.grootes@esciencecenter.nl>

ENV PG_VERSION 11
ENV POSTGIS_VERSION 2.5

ENV POSTGIS_GDAL_ENABLED_DRIVERS=ENABLE_ALL

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           postgresql-$PG_VERSION-postgis-$POSTGIS_VERSION \
           postgresql-$PG_VERSION-postgis-$POSTGIS_VERSION-scripts \
           postgis \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
COPY ./update-postgis.sh /usr/local/bin
