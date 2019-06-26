# AHN3_PostGIS

This repository provides code and instructions for setting up a a PostGIS database and using it to interact with the AHN3 data set processed by Laserchicken. In particular this enables an eefficent identification of processed LiDAR data associated with geographical regions


# PostGIS server

The PostGIS server is (currently, i.e. during the eecolidar project) running in a Docker container on the eecolidar1 VM and is listening on port `5432`. The database is named `eecolidar_ahn3_postgis`. Please contact @meiertgrootes for the host IP, username ,and password.

The docker image of the PostGIS server can be found on [DockerHub organization of eecolidar](https://hub.docker.com/u/eecolidar/).
Instructions on how to pull or/and build the container, as well as how to run it are provided below and in the AH2_Kadaster repository of the eEcoLiDAR organization.


## Connection to the PostGIS server

### Using pgAdmin (Suggested)

Install [pgAdmin](https://www.pgadmin.org) and follow the [instructions](https://www.pgadmin.org/docs/pgadmin4/3.x/connect_to_server.html).

### Using psql
```
psql -h ServerIP -p 5432 -U username
```

#### Using psql from a Docker image
You can also use PostgreSQL Docker image to connect to the server.

```
docker pull postgres
docker run --rm -ti username /usr/bin/psql --help
```



# The eecolidar_ahn3_postgis database

The `eecolidar_ahn3_postgis` data base currently contains the table `tile_bboxes_all` which contains the bounding boxes for each of the constituent tiles of the retiled AHN3 data set.

Users can upload regions of interest in supported formats (shapefiles, gml, csv with wkt or wkb geometries,...) and query intersections to rapidly select data subtiles. Resulting lists can be exported and used in batch processing.

We refer the reader to the extensive documentation in the AHN2_Kadaster repository adressing interaction with and querying of a PostGIS database






# Docker database installation

The Docker image of the PostGIS server can be found on [DockerHub organization of eecolidar](https://hub.docker.com/u/eecolidar/).

One can pull the image by running:
```
docker pull eecolidar/eecolidar_ahn3_postgis
```


## Setup


### Install docker
Install docker [Follow the instructions](https://docs.docker.com/install/) to install docker.


### Change docker volume storage path
```
sudo systemctl stop docker
sudo mkdir /data/local/docker-data
```

Add the lines below to **/etc/docker/daemon.json**:
```
{
	"data-root": "/data/local/docker-data"
}
```

### Restart docker
```
sudo systemctl start docker
```


## Start the server
```
sudo docker run -d --name eecolidar_ahn3_postgis -e POSTGRES_PASSWORD=password -p 5432:5432 docker pull eecolidar/eecolidar_ahn3_postgis
```

## Setup the firewall
If firewall needs to be configured, the command below opens port for PostGIS server on Ubuntu.
``` 
sudo ufw allow 5432/tcp
```

