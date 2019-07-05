# Zabbix monitoring solution with Slack integration
[![](https://images.microbadger.com/badges/version/d3vm/zabbix-slack.svg)](https://microbadger.com/images/d3vm/zabbix-slack) [![](https://images.microbadger.com/badges/image/d3vm/zabbix-slack.svg)](https://microbadger.com/images/d3vm/zabbix-slack)


## !!! Not stable, please don't use even for production. !!!

---

Please wait estimate 2 minutes after run the docker-compose.

Create webhook url in "Incoming Webhooks" app
https://slack.com/apps/A0F7XDUAZ-incoming-webhooks

Default login data (superuser privilege)
Username: Admin
Password: zabbix

How-to initialize slack script:
- Administration » Media types
- Create media type
- Select the "Script" option in the Type section
- The script name is `slack.sh`
-  Create some parameters:
-  `#zabbix`
-  `{ALERT.SUBJECT}`
-  `{ALERT.MESSAGE}`
-  `https://hooks.slack.com/services/webhook_url/from_webhooks_app`
- Just saved and ready

---

Thanks for [Ericoc](https://github.com/ericoc) for the main slack script!  

