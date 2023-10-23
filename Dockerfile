FROM ubuntu:latest AS build
RUN apt update
RUN apt install docker.io -y
COPY . .

FROM ubuntu:latest

EXPOSE 22

COPY --from=build /target/rest-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["docker","run","ubuntu"]
CMD ["docker","ps"]


