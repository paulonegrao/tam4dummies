#!/bin/bash

#EXECUTABLE='mvn -f /home/pi/ytlive/api-samples/java/pom.xml exec:java -Dexec.mainClass="com.google.api.services.samples.youtube.cmdline.live.SetTransition" -Dexec.args="'$1' '$2'"'
EXECUTABLE='java -cp /home/pi/ytlive/api-samples/java/target/samples-0.0.1-SNAPSHOT.jar com.google.api.services.samples.youtube.cmdline.live.SetTransition '$1 $2

eval $EXECUTABLE
