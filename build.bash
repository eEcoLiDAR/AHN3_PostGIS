#!/bin/bash

docker build --tag eecolidar_ahn3_postgis --label eecolidar_ahn3_postgis .

## to run:
## docker run --rm -ti --name eecolidar_ahn3_postgis -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432  eecolidar_ahn3_postgis


## to push:
## docker tag eecolidar_ahn3_postgis $DOCKER_ID_USER/eecolidar_ahn3_postgis
## docker push $DOCKER_ID_USER/eecolidar_ahn3_postgis
