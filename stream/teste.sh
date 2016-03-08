#!/bin/bash

while [ 1 -gt 0 ]; do
    alive=$(expr `date +%s` - `stat -c %Y /home/pi/rails/tam4dummies/stream/tam_keep_alive`)
    if [ "$alive" -gt 6 ];  then
       sudo kill $(ps aux | grep 'gst-launch-1.0 ximagesrc' | awk '{print $2}')
echo "kilouuuuuu................."
       break  # Skip entire rest of loop.
    fi
    echo -n "$alive "
	echo "no loop....."
done

exit 0

kill $(ps aux | grep 'gst-launch-1.0 ximagesrc' | awk '{print $2}')
exit 111

expr `date +%s` - `stat -c %Y tam_keep_alive`

alive=$(expr `date +%s` - `stat -c %Y tam_keep_alive `)

if [ "$alive" -gt 3 ]
 then
    echo 'maior'
 fi

echo $alive
