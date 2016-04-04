#!/bin/bash
# tfd.s09 - Stream to YT Live Streaming
# $1 = stream_name; $2 = broadcast_id
echo "stream_name="$1"; broadcast_name="$2

# kills OLD(-o) "gstreamer" leftovers
# pkill -f -o "gst-launch-1.0 ximagesrc"
# kills OLD(-o) "SetTransition LIVE" leftovers
# pkill -f -o "youtube.cmdline.live.SetTransition -Dexec.args=live"

EXECUTABLE='gst-launch-1.0 ximagesrc startx=0 use-damage=0 ! video/x-raw,framerate=30/1 ! videoscale method=0 ! video/x-raw,width=1920,height=1080 ! videoconvert ! queue ! omxh264enc target-bitrate=2000000 control-rate=1 ! "video/x-h264,profile=high" ! h264parse ! queue ! mux. audiotestsrc is-live=true ! audioresample ! audio/x-raw,rate=48000 ! queue ! voaacenc bitrate=128000 ! queue ! flvmux streamable=true name=mux ! rtmpsink location="rtmp://a.rtmp.youtube.com/live2/'$1' live=2"'

# starts Stream to Youtube ingestion id "stream_name"
eval $EXECUTABLE &

# calls TransitionBroadcast to LIVE (YT status to initiate the "live" for viewers)
/home/pi/rails/tam4dummies/stream/transition_broadcast.sh "live" $2 &

while [ 1 -gt 0 ]; do
    # verifies  if tam_keep_alive update timestamp > 12 secs  ....
    alive=$(expr `date +%s` - `stat -c %Y /home/pi/rails/tam4dummies/stream/tam_keep_alive`)
    if [ "$alive" -gt 20 ];  then
       # kills current "gstreamer"
       # pkill -f -o "gst-launch-1.0 ximagesrc"
       kill $(ps aux | grep "gst-launch-1.0 ximagesrc" | grep $1 | awk '{print $2}')
       # kills current "SetTransition LIVE" leftovers
       # pkill -f -o "youtube.cmdline.live.SetTransition -Dexec.args=live"
       kill $(ps aux | grep "youtube.cmdline.live.SetTransition live" | grep $2 | awk '{print $2}')
       # call ""SetTransition COMPLETE" to stop broadcast streaming on Youtube & get it done
       /home/pi/rails/tam4dummies/stream/transition_broadcast.sh "complete" $2 &
       echo "tam_keep_alive expired... exiting stream_yt.sh..."
       break
    fi
done

exit 0
