#!/bin/bash

    alive=$(expr `date +%s` - `stat -c %Y /home/pi/rails/tam4dummies/stream/tam_keep_alive`)
echo -n "$alive"

if [ "$alive" -gt 10 ];  then
       echo "kilouuuuuuuuu....."
	exit 0 
fi
echo -n "zebra..."
exit 1



#kill $(ps aux | grep 'gst-launch-1.0 ximagesrc' | awk '{print $2}')

timestamp=`date +%F_%H-%M-%S`

#EXECUTABLE='gst-launch-1.0 ximagesrc startx=0 use-damage=0 ! video/x-raw,framerate=30/1 ! videoscale method=0 ! video/x-raw,width=1920,height=1080 ! videoconvert ! queue ! omxh264enc target-bitrate=2000000 control-rate=1 ! "video/x-h264,profile=high" ! h264parse ! queue ! mux. audiotestsrc is-live=true ! audioresample ! audio/x-raw,rate=48000 ! queue ! voaacenc bitrate=128000 ! queue ! flvmux streamable=true name=mux ! rtmpsink location="rtmp://a.rtmp.youtube.com/live2/brancaleonestuff.f7fs-qwy7-u1xt-7txb live=2"'
EXECUTABLE='gst-launch-1.0 playbin uri=file:///home/pi/big_buck_bunny.mp4 &'

echo $$ > /home/pi/rails/tam4dummies/stream/run/$1.pid
exec  /usr/bin/gst-launch-1.0 playbin uri=file:///home/pi/big_buck_bunny.mp4 &
exit $?

eval $EXECUTABLE

while [ 1 -gt 0 ]; do
    alive=$(expr `date +%s` - `stat -c %Y /home/pi/rails/tam4dummies/stream/tam_keep_alive`)
    if [ "$alive" -gt 10 ];  then
       kill $(ps aux | grep 'gst-launch-1.0 ximagesrc' | awk '{print $2}')
       break  # Skip entire rest of loop.
       echo 'kilouuuuuuuuu.....' 
   fi
    echo -n "$alive "
    echo 'no loooooooooop"
done

exit 0
