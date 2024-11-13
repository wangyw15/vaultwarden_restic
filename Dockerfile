FROM vaultwarden/server:latest-alpine

VOLUME /data
VOLUME /log
EXPOSE 80

# [optional] change package source
# RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors.tuna.tsinghua.edu.cn/alpine#g' /etc/apk/repositories
# RUN apk update

# install packages
RUN apk add tzdata restic

# set timezone
RUN ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

WORKDIR /

# backup at 03:00 every day
COPY backup.sh /
RUN chmod +x /backup.sh
RUN echo "0 3 * * * /backup.sh" >> crontab_conf
RUN crontab crontab_conf

CMD ["/bin/sh", "-c", "crond -b -L /log/crontab.log && ./start.sh"]
