#!/bin/sh
/opt/lampp/xampp startmysql
sleep 600
java -jar /target/rest-0.0.1-SNAPSHOT.jar
