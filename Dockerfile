FROM ubuntu:latest
RUN apt update
RUN apt-get install wget -y
RUN wget https://downloads.sourceforge.net/project/xampp/XAMPP%20Linux/8.0.28/xampp-linux-x64-8.0.28-0-installer.run
RUN chmod +x xampp-linux-x64-8.0.28-0-installer.run
RUN ./xampp-linux-x64-8.0.28-0-installer.run
COPY . .

EXPOSE 3306
ENTRYPOINT ["/opt/lampp/xampp/","start"]


CMD ["mysql","-u","root","-p"]


