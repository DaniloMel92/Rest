FROM ubuntu:latest AS build
RUN apt-get update
RUN dpkg --add-architecture i386
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y
RUN apt-get install wget -y
RUN sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt/ -pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
RUN apt-get install gnupg1 -y
RUN apt-get install gnupg2 -y
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install postgresql-12 -y
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
