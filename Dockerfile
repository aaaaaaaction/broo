FROM alpine:latest

RUN apk add wget




RUN wget https://github.com/txthinking/brook/releases/download/v20220515/brook_linux_amd64 -O brook
RUN chmod +x brook
RUN mv brook /root



ADD startup.sh /startup.sh
RUN chmod +x /startup.sh

CMD /startup.sh


