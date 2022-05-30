FROM openjdk:19-jdk-slim

LABEL maintainer="Jan Philipp Sachs" \
      email="jan-philipp.sachs@hpi.de" \
      institution="Hasso Plattner Institute, University of Potsdam, Germany"

RUN groupadd -r leastprivilegedgroup && \
    useradd -r -s /bin/false -g leastprivilegedgroup leastprivilegeduser

RUN mkdir ./data
WORKDIR /data

USER leastprivilegeduser

ENV apikey=0

ENTRYPOINT [ "sh", "-c", "java -Dumls-apikey=$apikey -jar cpt4.jar 5" ]