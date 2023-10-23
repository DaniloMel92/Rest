FROM ubuntu:latest AS build
RUN apt update

COPY . .

FROM openjdk:17-jdk-slim

EXPOSE 22

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar



