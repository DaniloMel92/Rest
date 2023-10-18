FROM ubuntu:18.04 AS build
RUN apt-get update
RUN apt install wget -y
RUN apt install gnupg2 -y
RUN apt install gnupg1 -y
RUN wget https://downloads.sourceforge.net/project/xampp/XAMPP%20Linux/8.0.28/xampp-linux-x64-8.0.28-0-installer.run
RUN chmod +x xampp-linux-x64-8.0.28-0-installer.run
RUN ./xampp-linux-x64-8.0.28-0-installer.run
RUN /opt/lampp/xampp start mysql
RUN mysql -h localhost -u root -p
RUN CREATE DATABASE api_rest;
RUN exit
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y
COPY . .

FROM openjdk:17-jdk-slim

EXPOSE 8000

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT [  "java","-jar","app.jar"  ]
