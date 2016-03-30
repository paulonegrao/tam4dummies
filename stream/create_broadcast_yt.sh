#!/bin/bash

echo $1

#EXECUTABLE='mvn -f /home/pi/ytlive/api-samples/java/pom.xml exec:java -Dexec.mainClass="com.google.api.services.samples.youtube.cmdline.live.CreateBroadcast" -Dexec.args="'$args$
EXECUTABLE='java -cp /home/pi/ytlive/api-samples/java/target/samples-0.0.1-SNAPSHOT.jar com.google.api.services.samples.youtube.cmdline.live.CreateBroadcast '$1
eval $EXECUTABLE
