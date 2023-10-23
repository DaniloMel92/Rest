FROM ubuntu:latest AS build
RUN apt update
RUN apt install openjdk-17-jdk -y
RUN apt install mysql-server -y
RUN apt install sudo -y
RUN su mysql
COPY . .

FROM openjdk:17-jdk-slim

EXPOSE 8000

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar



ENTRYPOINT [  "mysql"  ]
CMD ["bash"]
