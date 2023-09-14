FROM openjdk:8-jre-alpine
ADD target/.jar rest-0.0.1-SNAPSHOT.jar
WORKDIR /app
COPY target/.jar /app/rest-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "/rest-0.0.1-SNAPSHOT.jar"]


