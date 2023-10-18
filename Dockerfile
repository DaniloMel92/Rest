FROM ubuntu:latest AS build
RUN apt update
RUN apt install openjdk-17-jdk -y
RUN apt install maven -y
RUN apt install wget -y
RUN sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RUN apt update
RUN apt install postgresql-12 -y
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
