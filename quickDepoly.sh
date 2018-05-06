#!/bin/bash

mvn clean package

docker build -t tale/huangwt:mysql .

docker stop tale

docker rm tale

docker rmi tale/huangwt:mysql

docker run --name tale -d -p 8080:9000  -p 5005:5005  -v /data/logs/tale:/data/logs/tale   --env JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"    tale/huangwt:mysql