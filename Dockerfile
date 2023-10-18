FROM ubuntu/postgres:latest AS build
RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y
RUN apt-get install wget -y
RUN su postgres 
RUN psql 
RUN ALTER USER postgres ENCRYPTED PASSWORD 'danilo';
RUN create database api_rest;
RUN \q
RUN exit
RUN systemctl restart postgresql

COPY . .

FROM openjdk:17-jdk-slim

EXPOSE 8000

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT [  "java","-jar","app.jar"  ]
