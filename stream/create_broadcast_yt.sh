#!/bin/bash

echo "stream_id="$1
echo "args_create="$2

#sd=`date -d "10 minutes" +%F"T"%T"-08:00"`
#ed=`date -d "2 hours" +%F"T"%T"-08:00"`
#args="titulo  titulost "$sd" "$ed" descricao da encrenca"

# clean CreateBraodcast directory
rm /home/pi/rails/tam4dummies/stream/create_broadcast/*

OUTPUT=`java -cp /home/pi/ytlive/api-samples/java/target/samples-0.0.1-SNAPSHOT.jar com.google.api.services.samples.youtube.cmdline.live.CreateBroadcast $2`

broadcast_id=`echo $OUTPUT | awk 'BEGIN {FS="@@t4d_arg="} {print $2}'`
stream_name=`echo $OUTPUT | awk 'BEGIN {FS="@@t4d_arg="} {print $3}'`

echo "CreatBroadcast OUTPUT="$OUTPUT
echo "brodcast_id="$broadcast_id
echo "stream_name="$stream_name

if [ -z "$broadcast_id" ] || [ -z "$stream_name" ]; then
   # error on CreateBroadcast; flags error in the broadcast_id directory
   touch /home/pi/rails/tam4dummies/stream/create_broadcast/$1@@t4d@@error@@t4d@@error
else
   # CreateBroadcast OK; insert args on fname
   touch /home/pi/rails/tam4dummies/stream/create_broadcast/$1@@t4d@@$broadcast_id@@t4d@@$stream_name
fi
