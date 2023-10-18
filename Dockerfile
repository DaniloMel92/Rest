FROM ubuntu/postgres:latest AS build
RUN apt-get update
RUN su postgres
RUN postgres -e POSTGRES_PASSWORD=postgres -v pgdata:/var/lib/postgresql/data postgres
RUN psql -h localhost -p 5432 -U postgres
RUN CREATE DATABASE api_rest;
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y
COPY . .

FROM openjdk:17-jdk-slim

EXPOSE 8000

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT [  "java","-jar","app.jar"  ]
