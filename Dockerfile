FROM ubuntu/mysql:latest AS build
RUN apt-get update
RUN mysql_secure_installation
RUN danilo
RUN danilo
RUN mysql
RUN ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';
RUN FLUSH PRIVILEGES;
RUN \q
RUN mysql -u root -p
RUN CREATE DATABASE api_rest;
RUN exit
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y
COPY . .

FROM openjdk:17-jdk-slim

EXPOSE 8000

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT [  "java","-jar","app.jar"  ]
