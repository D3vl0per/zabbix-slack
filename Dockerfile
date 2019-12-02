FROM zabbix/zabbix-server-mysql:alpine-4.4.3

LABEL maintainer="Zsibok Mark <zsmark@zsmark.dev>"
LABEL description="Zabbix server with slack integration"
LABEL VERSION="1.9"

COPY ./scripts/slack.sh /usr/lib/zabbix/alertscripts/slack.sh

#Zabbix user create https://github.com/zabbix/zabbix-docker/blob/4.4.1/server-mysql/alpine/Dockerfile
USER root

RUN apk add --no-cache curl
    #&& chown nobody:nogroup /usr/lib/zabbix/alertscripts/slack.sh

USER zabbix
