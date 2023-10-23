FROM ubuntu:latest
RUN apt update
RUN apt install docker.io -y
RUN service docker stop
RUN service docker start
COPY . .

EXPOSE 22

ENTRYPOINT ["docker","run","ubuntu"]
CMD ["docker","ps"]


