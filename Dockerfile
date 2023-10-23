FROM ubuntu:latest
RUN apt update
RUN apt install docker.io -y
COPY . .

EXPOSE 22

ENTRYPOINT ["docker","run","ubuntu"]
CMD ["docker","ps"]


