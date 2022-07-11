FROM jlesage/baseimage-gui:ubuntu-20.04

ENV ENABLE_CJK_FONT=1
RUN add-pkg curl
RUN add-pkg locales
ENV LANG=zh_CN.UTF-8
RUN locale-gen zh_CN.UTF-8
RUN curl https://down.115.com/client/115pc/lin/115pc_1.0.8.9.deb -o /tmp/115pc_1.0.8.9.deb

RUN dpkg -i /tmp/115pc_1.0.8.9.deb

COPY startapp.sh /startapp.sh

ENV APP_NAME="115pc"
