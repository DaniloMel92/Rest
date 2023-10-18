FROM ubuntu:latest AS build
RUN apt update
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y
RUN apt install wget -y
RUN wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.4/xampp-linux-x64-8.2.4-0-installer.run
RUN chmod +x xampp-linux-x64-8.2.4-0-installer.run
RUN ./xampp-linux-x64-8.2.4-0-installer.run
RUN /opt/lampp startmysql
RUN mysql -h localhost -u root -p
RUN create database api_rest;
RUN exit
COPY . .

FROM openjdk:17-jdk-slim

EXPOSE 8000

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT [  "java","-jar","app.jar"  ]
