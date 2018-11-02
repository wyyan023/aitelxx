#!/bin/sh
/usr/local/bin/inotifywait -mrq -e modify,attrib,move,create,delete /www/wwwroot/120.79.142.199/uploads/audio/ | while read file
do
    rsync -av /www/wwwroot/120.79.142.199/uploads/audio/ 47.106.171.11:/var/smartivr/uploads/audio/
    echo "$file在`date +'%F %T %A'`同步成功" >> /var/log/rsync.log
done
