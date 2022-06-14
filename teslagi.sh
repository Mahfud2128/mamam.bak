#!/bin/bash

CHATID="5325141986"
KEY="5282675654:AAG7hJhGrbXWB2Q9jYbbh01AHwfl6nV96Hk"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="https://!---
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT" $URL >/dev/null

