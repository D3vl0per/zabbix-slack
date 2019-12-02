  FROM zabbix/zabbix-server-mysql:alpine-4.4.3

  LABEL maintainer="Mark Zsibok <info@zsmark.dev>"
  LABEL description="Zabbix server with slack integration"
  LABEL VERSION="2.0"

  COPY --chown=zabbix:zabbix ./scripts/ /usr/lib/zabbix/alertscripts/

  #Zabbix user create https://github.com/zabbix/zabbix-docker/blob/4.4.1/server-mysql/alpine/Dockerfile
  USER root

  RUN apk add --no-cache python3 \
      && pip3 install --upgrade pip \
      && pip3 install -r /usr/lib/zabbix/alertscripts/requirements.txt

  USER zabbix
