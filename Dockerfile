FROM ubuntu:latest
RUN apt update
RUN apt-get install  curl apt-transport-https ca-certificates software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt update
RUN apt install docker-ce -y
COPY . .

EXPOSE 22
CMD ["docker","ps"]


