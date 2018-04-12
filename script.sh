#!/bin/bash
export DISPLAY=":1"

if [ -z "$PORT" ]
then
  # $PORT variable empty or not set
  VNC_PORT=5901
else
  # read the value
  VNC_PORT=$PORT
fi

vncserver $DISPLAY -geometry 1280x800 -rfbport $VNC_PORT && \
tail -f /root/.vnc/*.log & \
google-chrome --args \
--test-type \
--no-sandbox \
--no-first-run \
--enable-precise-memory-info \
--disable-extensions \
--allow-running-insecure-content \
--user-data-dir=/root/chrome-profile \
--reduce-security-for-testing \
$@
