FROM alpine:latest

RUN apk add wget
RUN apk add nohup



RUN wget https://github.com/txthinking/brook/releases/download/v20220515/brook_linux_amd64 -O brook
RUN chmod +x brook
RUN mv brook /root

RUN wget https://github.com/txthinking/nico/releases/download/v20220420/nico_linux_amd64 -O nico
RUN chmod +x nico
RUN mv nico /root




RUN nohup ./root/brook  wsserver -l :25566 -p $UUID --path /ws &
RUN nohup ./root/nico $APP_DOMAIN https://reactjs.org $APP_DOMAIN/ws http://127.0.0.1:25566 &

RUN echo $UUID
RUN echo $APP_DOMAIN


