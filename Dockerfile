<<<<<<< HEAD:ubuntu.dockerfile
FROM ubuntu:latest AS build
RUN apt update
RUN apt install docker.io -y
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y
RUN apt install wget -y
COPY . .

FROM openjdk:17-jdk-slim

EXPOSE 8000

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar



ENTRYPOINT [  "java","-jar","app.jar"  ]

=======
FROM ubuntu:latest AS build
RUN apt update
RUN apt install docker.io -y
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y
RUN apt install wget -y
RUN docker build -t rest_api-db .

COPY . .

FROM openjdk:17-jdk-slim
FROM mysql:5.7
EXPOSE 8000

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT [  "java","-jar","app.jar"  ]
>>>>>>> 571ad70f7f124fbe613fc431d3a92ea92307dbc8:Dockerfile
