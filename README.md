To build:

```
docker build -t dataminelab/scala-spark .
```

To run:

```
docker run --rm -it -p 4040:4040 -v $PWD/spark-examples:/var/examples dataminelab/scala-spark bash
```

To push to the repository:

```
docker tag [OPTIONS] IMAGE[:TAG] [REGISTRYHOST/][USERNAME/]NAME[:TAG]
docker push NAME[:TAG]
```

Example:
```
docker tag bf4db74eb2bd dataminelab/scala-spark:latest
docker push dataminelab/scala-spark:latest
```# docker-spark
