#!/bin/bash

EXECUTABLE='mvn -f /home/pi/ytlive/api-samples/java/pom.xml exec:java -Dexec.mainClass="com.google.api.services.samples.youtube.cmdline.live.SetTransition" -Dexec.args="'$1' '$2'"'
eval $EXECUTABLE
