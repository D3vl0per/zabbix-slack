#!/usr/bin/python3
import sys
import json
import requests

def send_message(webhook,payload):
    try:
        response = requests.post(webhook, data=payload, headers={'Content-Type': 'application/json'})
        if (response.content == b'ok'):
            print("Sent succesful!")
        else:
            print("Error: ", response.status_code)
    except Exception as em:
        print("Exception: " + str(em))

if __name__ == '__main__':
    send_message(sys.argv[1], sys.argv[2])
