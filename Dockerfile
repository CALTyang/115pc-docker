FROM jlesage/baseimage-gui:ubuntu-20.04
ENV ENABLE_CJK_FONT=1
RUN add-pkg curl
RUN add-pkg locales
ENV LANG=zh_CN.UTF-8
RUN locale-gen zh_CN.UTF-8
RUN curl https://down.115.com/client/115pc/lin/115pc_2.0.2.9.deb -o /tmp/115pc.deb
RUN dpkg -i /tmp/115pc.deb
COPY startapp.sh /startapp.sh
ENV APP_NAME="115pc"
