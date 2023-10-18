FROM ubuntu/mysql:latest AS build
RUN apt update
RUN apt install wget -y
RUN wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.4/xampp-linux-x64-8.2.4-0-installer.run


RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y
COPY . .

FROM openjdk:17-jdk-slim

EXPOSE 8000

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT [  "java","-jar","app.jar"  ]
