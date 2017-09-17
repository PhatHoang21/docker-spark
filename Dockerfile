FROM gettyimages/spark

MAINTAINER Datamine Lab "https://github.com/dataminelab"

RUN apt-get update \
 && apt-get install -y zip \
 && curl -s "https://get.sdkman.io" | bash \
 && /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh" \
 && /bin/bash -l -c "sdk install scala" \
 && /bin/bash -l -c "sdk install sbt" \
 && pip install awscli --upgrade --user \
 && echo 'alias ll="ls -l"' >> ~/.bashrc \
 && echo 'export PATH=/root/.local/bin/:$PATH' >> ~/.bashrc \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV SDKMAN_DIR /root/.sdkman

