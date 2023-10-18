FROM ubuntu:latest AS build
FROM mysql:latest
RUN apt update
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y
RUN apt install wget -y
COPY . .

FROM openjdk:17-jdk-slim

EXPOSE 8000

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT [  "java","-jar","app.jar"  ]
