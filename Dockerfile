FROM zabbix/zabbix-server-mysql:alpine-4.2.3

LABEL maintainer="Zsibok Mark <zsmark@zsmark.dev>"
LABEL description="Zabbix server with slack integration"
LABEL VERSION="1.0"

COPY ./scripts/slack.sh /usr/lib/zabbix/alertscripts/slack.sh

RUN apk add --no-cache curl
    #&& chown nobody:nogroup /usr/lib/zabbix/alertscripts/slack.sh

RUN rm -rf /var/cache \
    && rm -rf /etc/apk \
    && rm -rf /lib/apk/db/ \
    && rm -rf /usr/share/apk \
    && rm -rf /var/cache \
    && rm -rf /var/spool/
    