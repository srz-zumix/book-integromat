#!/bin/sh

if [ -f /work/skicka/env.sh ]; then
    . /work/skicka/env.sh
    sed -i -e "s/;clientid=YOUR_GOOGLE_APP_CLIENT_ID/clientid=$GOOGLE_CLIENT_ID/" ~/.skicka.config
    sed -i -e "s/;clientsecret=YOUR_GOOGLE_APP_SECRET/clientsecret=$GOOGLE_CLIENT_SECRET/" ~/.skicka.config
fi

skicka -no-browser-auth ls && cat /root/.skicka.tokencache.json && cp /root/.skicka.tokencache.json /work/skicka/.skicka.tokencache.json
