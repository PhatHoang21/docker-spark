To build:

```
docker build -t dataminelab/dev-spark .
```

To run:

```
docker run --rm -it -p 4040:4040 -v $PWD/spark-examples:/var/examples dataminelab/dev-spark bash
```

