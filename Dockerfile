FROM ubuntu:latest AS build
RUN apt update
RUN apt install mysql-server -y
RUN service mysql stop
COPY . .

FROM openjdk:17-jdk-slim

EXPOSE 8000

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar



ENTRYPOINT [  "mysqld_safe","----skip-grant-tables &","  ]
CMD ["bash"]
