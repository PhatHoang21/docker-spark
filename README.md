# spark

A [gettyimages/spark](https://hub.docker.com/r/gettyimages/spark/) based [Spark](http://spark.apache.org) container with few additional tools:

* Scala
* Sbt

Can be used to run standalone Spark or together with `docker-compose.yml` can run a local cluster.

## docker example

To run `SparkPi`, run the image with Docker:

    docker run --rm -it -p 4040:4040 dataminelab/dev-spark bin/run-example SparkPi 10

To simply run in bash and share volume folder:

```
docker run -d --rm -p 4040:4040 -p 8080:8080 -p 18080:18080 -v $PWD/spark-examples:/var/examples dataminelab/dev-spark
# to see logs
docker ps
docker logs -f [container-id]
# to connect with bash to the running container
docker exec -it [container-id] /bin/bash
```

Note, it might be useful to map ivy files to avoid downloading packages each time docker is restarted:
```
mkdir $PWD/.sbt
mkdir $PWD/.ivy2
docker run -d --rm -p 4040:4040 -p 8080:8080 -p 18080:18080 -v $PWD/spark-examples:/var/examples -v $PWD/.ivy2:/root/.ivy2 -v $PWD/.sbt/:/root/.sbt/ dataminelab/dev-spark
```

See dockerhub:
https://hub.docker.com/r/dataminelab/dev-spark/

To build locally:

```
docker build -t dataminelab/dev-spark .
```

## Docker compose

To run a local cluster

To create a simplistic standalone cluster with docker-compose:

```
docker-compose up -d
```

The SparkUI will be running at http://${YOUR_DOCKER_HOST}:8080 with one worker listed. To run pyspark, exec into a container:

```
docker exec -it dockerspark_master_1 /bin/bash
bin/pyspark
```

To run SparkPi, exec into a container:

```
docker exec -it dockerspark_master_1 /bin/bash
bin/run-example SparkPi 10
```

