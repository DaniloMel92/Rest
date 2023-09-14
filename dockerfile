FROM openjdk:11
COPY . /home/danilo/rest/target/rest-0.0.1-SNAPSHOT.jar 
WORKDIR /home/danilo/rest/target/rest-0.0.1-SNAPSHOT.jar 
ENTRYPOINT ["java", "-jar", "rest-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080

