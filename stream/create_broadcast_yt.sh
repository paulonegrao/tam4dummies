#!/bin/bash

echo $1
echo $2
echo $3
sd=`date -d "10 minutes" +%F"T"%T"-08:00"`
ed=`date -d "2 hours" +%F"T"%T"-08:00"`
echo $sd
echo $ed
args=$1" "$2" "$sd" "$ed" "$3
echo $args

EXECUTABLE='mvn -f /home/pi/ytlive/api-samples/java/pom.xml exec:java -Dexec.mainClass="com.google.api.services.samples.youtube.cmdline.live.CreateBroadcast" -Dexec.args="'$args$
eval $EXECUTABLE
