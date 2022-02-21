# Pull base image.
FROM jlesage/baseimage-gui:ubuntu-20.04

ENV ENABLE_CJK_FONT=1
RUN curl https://down.115.com/client/115pc/lin/115pc_1.0.1.6.deb -O /app/115pc_1.0.1.6.deb

RUN dpkg -i /app/115pc_1.0.1.6.deb

COPY startapp.sh /startapp.sh

ENV APP_NAME="115pc"
