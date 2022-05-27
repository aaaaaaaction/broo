#!/bin/sh


envsubst '\$PORT' < /root/nginx.template.conf > /root/nginx.conf



if [[ $TUNNEL_TOKEN ]]; then
echo 'has tunnel token, run cloudflared tunnel'
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /root/cloudflared
chmod +x /root/cloudflared
/root/brook  wssserver --domainaddress $APP_DOMAIN:443 --password $UUID & /root/cloudflared tunnel --no-autoupdate run --token $TUNNEL_TOKEN & nginx -c /root/nginx.conf -g 'daemon off;'
else
/root/brook  wssserver --domainaddress $APP_DOMAIN:443 --password $UUID & nginx -c /root/nginx.conf -g 'daemon off;'
fi

