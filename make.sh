#!/bin/sh
rm -r /target/rest-0.0.1-SNAPSHOT.jar
rm -r /target/rest-0.0.1-SNAPSHOT.jar.original
/opt/lampp/xampp startmysql
sleep 600
java -jar /target/rest-0.0.1-SNAPSHOT.jar
