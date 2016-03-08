#!/bin/bash
# $1 = stream_name; $2 = broadcast_id
echo "stream_name="$1"; broadcast_name="$2

pkill -f "gst-launch-1.0 ximagesrc"
pkill -f "youtube.cmdline.live.SetTransition -Dexec.args=live"

#timestamp=`date +%F_%H-%M-%S`

EXECUTABLE='gst-launch-1.0 ximagesrc startx=0 use-damage=0 ! video/x-raw,framerate=30/1 ! videoscale method=0 ! video/x-raw,width=1920,height=1080 ! videoconvert ! queue ! omxh264enc target-bitrate=2000000 control-rate=1 ! "video/x-h264,profile=high" ! h264parse ! queue ! mux. audiotestsrc is-live=true ! audioresample ! audio/x-raw,rate=48000 ! queue ! voaacenc bitrate=128000 ! queue ! flvmux streamable=true name=mux ! rtmpsink location="rtmp://a.rtmp.youtube.com/live2/'$1' live=2"'

eval $EXECUTABLE &

# exec TransitionBroadcast to LIVE
/home/pi/rails/tam4dummies/stream/transition_broadcast.sh "live" $2 &

while [ 1 -gt 0 ]; do
    # verifies  if tam_keep_alive update  > 10 secs  ....  kills gts-launch (streaming to Youtube)
    alive=$(expr `date +%s` - `stat -c %Y /home/pi/rails/tam4dummies/stream/tam_keep_alive`)
    if [ "$alive" -gt 10 ];  then
       pkill -f "gst-launch-1.0 ximagesrc"
       pkill -f "youtube.cmdline.live.SetTransition -Dexec.args=live"
       # stop broadcast streaming on Youtube (COMPLETE)
       /home/pi/rails/tam4dummies/stream/transition_broadcast.sh "complete" $2 &
       echo "tam_keep_alive expired... exiting stream_yt.sh..."
       break
    fi
done

exit 0
