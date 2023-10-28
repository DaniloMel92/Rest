#!/bin/sh
/opt/lampp/xampp startmysql
sleep 45
java -jar /target/rest-0.0.1-SNAPSHOT.jar
