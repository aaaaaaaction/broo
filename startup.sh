#!/bin/sh










/root/brook  wsserver -l :80 -p $UUID --path /ws
/root/nico domain.com https://reactjs.org domain.com/ws http://127.0.0.1:80

