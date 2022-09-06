#!/bin/sh
if [ ! -d '/run/s6/services/app/'$'\n/Downloads/115download' ]
then
    mkdir -p '/run/s6/services/app/'$'\n/Downloads/115download'
    chmod a+w '/run/s6/services/app/'$'\n/Downloads/115download'
else
    echo "Path /run/s6/services/app/'$'\n/Downloads/115download is Ready!"
fi

export LC_ALL=zh_CN.UTF-8
exec /usr/local/115/115
