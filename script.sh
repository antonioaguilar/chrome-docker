#!/bin/bash
export DISPLAY=":1"

vncserver $DISPLAY -geometry 1440x900 && \
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
