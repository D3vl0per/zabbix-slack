
#!/bin/ash

to="$1"
subject="$2"
message="$3"
url="$4"
username="Zabbix"

# Change message emoji and notification color depending on the subject indicating whether it is a trigger going in to problem state or recovering
recoversub='^RECOVER(Y|ED)?$|^OK$|^Resolved.*'
problemsub='^PROBLEM.*|^Problem.*'

if [[ "$subject" =~ $recoversub ]]; then
    emoji=':smile:'
    color='#2ecc71'
#elif [[ "$subject" =~ $problemsub ]]; then
else
    emoji=':frowning:'
    color='#0C7BDC'
#else
#    emoji=':question:'
#    color='#CCCCCC'
fi

# Build JSON payload which will be HTTP POST'ed to the Slack.com web-hook URL
payload="payload={\"channel\": \"${to//\"/\\\"}\",  \
\"username\": \"${username//\"/\\\"}\", \
\"attachments\": [{\"fallback\": \"${subject//\"/\\\"}\", \"title\": \"${subject//\"/\\\"}\", \"text\": \"${message//\"/\\\"}\", \"color\": \"${color}\"}], \
\"icon_emoji\": \"${emoji}\"}"

# Execute the HTTP POST request of the payload to Slack via curl, storing stdout (the response body)
return=$(curl -sm 5 --data-urlencode "${payload}" $url)

# If the response body was not what was expected from Slack ("ok"), something went wrong so print the Slack error to stderr and exit with non-zero
if [[ "$return" != 'ok' ]]; then
    >&2 echo "$return"
    exit 1
fi
