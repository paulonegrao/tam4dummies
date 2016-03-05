#!/bin/bash

pkill -f "gst-launch-1.0 ximagesrc"

#timestamp=`date +%F_%H-%M-%S`

EXECUTABLE='gst-launch-1.0 ximagesrc startx=0 use-damage=0 ! video/x-raw,framerate=30/1 ! videoscale method=0 ! video/x-raw,width=1920,height=1080 ! videoconvert ! queue ! omxh2$

eval $EXECUTABLE &

while [ 1 -gt 0 ]; do
    alive=$(expr `date +%s` - `stat -c %Y /home/pi/rails/tam4dummies/stream/tam_keep_alive`)
    if [ "$alive" -gt 10 ];  then
       pkill -f "gst-launch-1.0 ximagesrc"

       echo -n "kilouuuuuuuuu....."
       break
    fi
    echo -n "$alive "
    echo -n "no loooooooooop"
done

exit 0
