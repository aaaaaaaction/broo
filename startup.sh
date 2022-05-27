#!/bin/sh


envsubst '\$PORT' < /root/nginx.template.conf > /root/nginx.conf



if [[ $TUNNEL_TOKEN ]]; then
echo 'has tunnel token, run cloudflared tunnel'
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /root/cloudflared
chmod +x /root/cloudflared
/root/brook  wsserver -l :443 -p $UUID & /root/cloudflared tunnel --no-autoupdate run --token $TUNNEL_TOKEN & nginx -c /root/nginx.conf -g 'daemon off;'
else
/root/brook  wsserver -l :443 -p $UUID & nginx -c /root/nginx.conf -g 'daemon off;'
fi

