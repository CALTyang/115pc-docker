FROM jlesage/baseimage-gui:ubuntu-18.04
LABEL maintainer="Hezekiah Ho, aka funcman <hyq1986@gmail.com>"

ENV APP_NAME        "115pc"
ENV APP_VERSION     "1.0.7.7"
ENV USER_ID         0
ENV GROUP_ID        0
ENV ENABLE_CJK_FONT 1
ENV DISPLAY_WIDTH   "1920"
ENV DISPLAY_HEIGHT  "1080"
ENV APT_SOURCE_HOST "mirrors.ustc.edu.cn"

RUN sed -i "s/archive.ubuntu.com/${APT_SOURCE_HOST}/g" /etc/apt/sources.list
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y curl locales
RUN export LANG=zh_CN.UTF-8 && locale-gen zh_CN.UTF-8
RUN curl https://down.115.com/client/115pc/lin/115pc_${APP_VERSION}.deb -o /tmp/115pc_${APP_VERSION}.deb
RUN dpkg -i /tmp/115pc_${APP_VERSION}.deb

COPY startapp.sh /startapp.sh
