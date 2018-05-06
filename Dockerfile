From openjdk:8u151-jdk-alpine

MAINTAINER  huangwt

COPY target/dist/tale /data/tale

WORKDIR /data/tale/

VOLUME  /data/logs/tale 

CMD java ${JAVA_OPTS}  -jar tale-1.1.0.jar  > /data/logs/tale/bootstrap.log 2>&1
