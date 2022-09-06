#!/bin/sh
echo [General] > /tmp/setting
echo download_path=/Downloads/115download       >  /tmp/setting
echo download_speed=0                           >> /tmp/setting
echo download_tasks=5                           >> /tmp/setting
echo last_download_path=/Downloads/115download/ >> /tmp/setting
echo upload_tasks=5                             >> /tmp/setting

cp -f /tmp/setting "/config/xdg/data/115/User Data/setting"

if [ ! -d '/Downloads/115download' ]
then
    mkdir -p '/Downloads/115download'
    chmod a+w '/Downloads/115download'
else
    echo "Path /Downloads/115download is Ready!"
fi

export LC_ALL=zh_CN.UTF-8
exec /usr/local/115/115
