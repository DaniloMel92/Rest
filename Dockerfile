FROM ubuntu/mysql:latest AS build
RUN mysqld_safe --skip-grant-tables &
RUN mysql_secure_installation

RUN n

RUN danilo

RUN danilo

RUN n

RUN n

RUN y

RUN y

RUN apt-get update

RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y
COPY . .

FROM openjdk:17-jdk-slim

EXPOSE 8000

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT [  "java","-jar","app.jar"  ]
