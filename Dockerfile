FROM ubuntu:latest AS build
RUN apt update

COPY . .

FROM ubuntu:latest

EXPOSE 22

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar



