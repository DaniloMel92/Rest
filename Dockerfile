FROM ubuntu:18.04 AS build
RUN apt-get update
RUN apt install wget -y
RUN apt install gnupg2 -y
RUN apt install gnupg1 -y
RUN sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install postgresql -y
RUN su postgres
RUN psql
RUN ALTER USER postgres ENCRYPTED PASSWORD 'postgres'
RUN CREATE DATABASE api_rest;
RUN \q
RUN exit
RUN systemctl restart postgresql
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y
COPY . .

FROM openjdk:17-jdk-slim

EXPOSE 8000

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT [  "java","-jar","app.jar"  ]
