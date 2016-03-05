#!/bin/sh

#echo $$ > /home/pi/rails/tam4dummies/stream/run/$1.pid
echo $$ > /home/pi/rails/tam4dummies/stream/run/gst-lunch-1.0.pid

exec "$@"
