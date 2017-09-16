FROM gettyimages/spark

MAINTAINER Datamine Lab "https://github.com/dataminelab"

RUN apt-get update \
 && apt-get install -y zip \
 && curl -s "https://get.sdkman.io" | bash \
 && /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh" \
 && /bin/bash -l -c "sdk install scala" \
 && /bin/bash -l -c "sdk install sbt" \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV SDKMAN_DIR /root/.sdkman

