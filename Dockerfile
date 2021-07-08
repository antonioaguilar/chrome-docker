FROM ubuntu:xenial
MAINTAINER Antonio Aguilar
ENV DEBIAN_FRONTEND=noninteractive
ENV USER root
ENV DISPLAY ":1"
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
RUN apt-get update && apt-get install -f -y \
    net-tools \
    nano \
    curl \
    grep \
    xvfb \
    xterm \
    i3-wm && \
    curl --progress-bar -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg --unpack google-chrome-stable_current_amd64.deb && \
    apt-get install -f -y && \
    rm google-chrome-stable_current_amd64.deb && \
    mkdir /main
RUN wget -q -O /tmp/tigervnc-1.9.0.x86_64.tar.gz https://sourceforge.net/projects/tigervnc/files/stable/1.9.0/tigervnc-1.9.0.x86_64.tar.gz/download && \
    cd /tmp && tar -xf tigervnc-1.9.0.x86_64.tar.gz && cp -R tigervnc-1.9.0.x86_64/* /
RUN echo "password\npassword\nn\n" | vncpasswd
RUN touch /root/.Xresources
ADD xstartup.sh /root/.vnc/xstartup
ADD config.sh /root/.i3/config
ADD script.sh /script.sh
WORKDIR /main
ENTRYPOINT ["/script.sh"]
