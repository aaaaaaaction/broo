FROM alpine:latest

RUN apk add nginx
RUN apk add gettext

COPY html /root/html/

RUN wget https://github.com/txthinking/brook/releases/download/v20220515/brook_linux_amd64 -O brook
RUN chmod +x brook
RUN mv brook /root

COPY nginx.template.conf /root/

ADD startup.sh /startup.sh
RUN chmod +x /startup.sh

CMD /startup.sh


